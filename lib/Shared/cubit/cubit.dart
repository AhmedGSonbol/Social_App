import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chats/chat_Screen.dart';
import 'package:social_app/Modules/feeds/feeds_Screen.dart';
import 'package:social_app/Modules/settings/settings_Screen.dart';
import 'package:social_app/Modules/users/users_Screen.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  User_Model? user_model;

  Future<void> getUserData()async
  {
    emit(AppGetUserLoadingState());

    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value)
    {
      emit(AppGetUserSuccessState());
      user_model = User_Model.fromJson(value.data()!);


    }).catchError((err)
    {
      print(err.toString() );
      emit(AppGetUserErrorState(error: err.toString() ));
    });

  }

  int currentNavIndex = 0;

  List<Widget> navScreens =
  [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles =
  [
    'News Feed',
    'Chat',
    'Users',
    'Settings'
  ];

  void changeBottomNav(int index)
  {


    if(index == 2)
      emit(AppNewPostState());
    else
    {


      currentNavIndex = index;
      print(currentNavIndex);
      emit(AppChangeBottomNavState());
    }

  }


  File? profile_image;

  final picker = ImagePicker();

  Future getProfileImage() async
  {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null)
    {
      profile_image = File(pickedImage.path);


      emit(AppProfileImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected !');
      emit(AppProfileImagePickedErrorState());
    }
  }

  File? cover_image;



  Future getCoverImage() async
  {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null)
    {
      cover_image = File(pickedImage.path);

      emit(AppCoverImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected !');
      emit(AppCoverImagePickedErrorState());
    }
  }


  void cancelUploadedCoverImage()
  {
    cover_image = null;
    coverImageURL = null;
    emit(AppCancelUploadedCoverImageState());
  }

  void cancelUploadedProfileImage()
  {
    profile_image = null;
    profileImageURL = null;
    emit(AppCancelUploadedProfileImageState());
  }


  String? profileImageURL;

  Future<void> uploadProfileImage()async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri.file(profile_image!.path).pathSegments.last}').
    putFile(profile_image!).then((value)async
    {
      await value.ref.getDownloadURL().then((value)
      {
        emit(AppProfileUploadImageSuccessState());
        print(value);
        profileImageURL = value;
      }).catchError((err)
      {
        emit(AppProfileUploadImageErrorState());
      });
    } ).catchError((err)
    {
      emit(AppProfileUploadImageErrorState());
    });
  }

  String? coverImageURL;

  Future<void> uploadCoverImage()async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri.file(cover_image!.path).pathSegments.last}').
    putFile(cover_image!).then((value)async
    {
      await value.ref.getDownloadURL().then((value)
      {
        emit(AppCoverUploadImageSuccessState());
        print(value);
        coverImageURL = value;
      }).catchError((err)
      {
        emit(AppCoverUploadImageErrorState());
      });
    } ).catchError((err)
    {
      emit(AppCoverUploadImageErrorState());
    });
  }

  Future<void> updateUser(
  {
    required var name,
    required var bio,
    required var phone,
})async
  {
    emit(AppUserUpdatingState());

    if(cover_image != null)
    {
      await uploadCoverImage();
    }

    if(profile_image != null)
    {
      await uploadProfileImage();
    }

    if(name == user_model!.name)
    {
      name = null;
    }

    if(phone == user_model!.phone)
    {
      phone = null;
    }

    if(bio == user_model!.bio)
    {
      bio = null;
    }


    User_Model model = User_Model(
        name: name,
        phone: phone,
        bio: bio,
        image: profileImageURL,
        cover: coverImageURL,


    );

    FirebaseFirestore.instance.collection('users').doc(user_model!.uId).
    update( model.toMap() ).then((value)
    {

      getUserData().then((value)
      {
        cover_image=null;
        coverImageURL=null;
        profile_image=null;
        profileImageURL=null;
        emit(AppUserUpdateSuccessState());
      });

    }).catchError((err)
    {
      emit(AppUserUpdateErrorState(err.toString()));
      print(err.toString());
    });
  }



  // ==========> 3 - Posts Section <==========

  // 3.1 - Create Post

  File? postImage;

  Future getPostImage() async
  {
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null)
    {
      postImage = File(pickedImage.path);

      emit(AppPostImagePickedSuccessState());
    }
    else
    {
      print('No Image Selected !');
      emit(AppPostImagePickedErrorState());
    }
  }

  void cancelUploadedPostImage()
  {
    postImage = null;
    emit(AppCancelUploadedPostImageState());
  }

  String? postImageURL;

  Future<void> uploadPostImage()async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri.file(postImage!.path).pathSegments.last}').
    putFile(postImage!).then((value)async
    {
      await value.ref.getDownloadURL().then((value)
      {
        emit(AppUploadPostImageSuccessState());

        postImageURL = value;

      }).catchError((err)
      {
        emit(AppUploadPostImageErrorState());
      });
    } ).catchError((err)
    {
      emit(AppUploadPostImageErrorState());
    });
  }

  Future<void> createPost(
      {
        required String datetime,
        required String text,

      })async
  {
    emit(AppCreatePostLoadingState());

    if(postImage != null)
    {
      await uploadPostImage();
    }

    Post_Model model = Post_Model(
      name: user_model!.name,
      image: user_model!.image,
      uId: user_model!.uId,
      datetime: datetime,
      text: text,
      postImage: postImageURL??'',

    );

    await FirebaseFirestore.instance.collection('posts').
    add( model.toMap() ).then((value)
    {

      emit(AppCreatePostSuccessState());

    }).catchError((err)
    {
      emit(AppCreatePostErrorState());
      print(err.toString());
    });
  }


  //Get Posts 3.2

  List<Post_Model> posts = [];

  void getPosts()
  {
    FirebaseFirestore.instance.collection('posts').get().then((value)
    {
      value.docs.forEach((ele)
      {
        posts.add(Post_Model.fromJson(ele.data()));
      });

      emit(AppGetPostsSuccessState());
    }).catchError((err)
    {
      emit(AppGetPostsErrorState(error: err.toString()));
    });
  }

}
