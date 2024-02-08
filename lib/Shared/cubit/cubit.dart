import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Models/comment_Model.dart';
import 'package:social_app/Models/message_Model.dart';
import 'package:social_app/Models/notification_Model.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Modules/chats/chat_Screen.dart';
import 'package:social_app/Modules/feeds/feeds_Screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/settings/settings_Screen.dart';
import 'package:social_app/Modules/users/users_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Remote/dio_Helper.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  void getAppData()
  {
    // initNotifications();
    getUserData();

    // getPosts();

    //     .then((value)
    // {
    //   getMyPosts();
    // });

  }

  User_Model? user_model;

  Future<void> getUserData() async
  {
    emit(AppGetUserLoadingState());

    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((
        value) {
      emit(AppGetUserSuccessState());
      user_model = User_Model.fromJson(value.data()!);
    }).catchError((err) {
      print(err.toString());
      emit(AppGetUserErrorState(error: err.toString()));
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
    if (index == 1)
    {
      getUsersChatWith();
    }
    else if (index == 3)
    {
      getUsers();
    }

    if (index == 2)
      emit(AppNewPostState());
    else {
      currentNavIndex = index;
      emit(AppChangeBottomNavState());
    }

    if(index == 4)
    {
      userPosts = [];
      getUserPosts(uId!);
    }
  }


  File? profile_image;

  final picker = ImagePicker();

  Future getProfileImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null) {
      profile_image = File(pickedImage.path);


      emit(AppProfileImagePickedSuccessState());
    }
    else {
      // print('No Image Selected !');
      emit(AppProfileImagePickedErrorState());
    }
  }

  File? cover_image;


  Future getCoverImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null) {
      cover_image = File(pickedImage.path);

      emit(AppCoverImagePickedSuccessState());
    }
    else {
      // print('No Image Selected !');
      emit(AppCoverImagePickedErrorState());
    }
  }


  void cancelUploadedCoverImage() {
    cover_image = null;
    coverImageURL = null;
    emit(AppCancelUploadedCoverImageState());
  }

  void cancelUploadedProfileImage() {
    profile_image = null;
    profileImageURL = null;
    emit(AppCancelUploadedProfileImageState());
  }


  String? profileImageURL;

  Future<void> uploadProfileImage() async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri
        .file(profile_image!.path)
        .pathSegments
        .last}').
    putFile(profile_image!).then((value) async
    {
      await value.ref.getDownloadURL().then((value) {
        emit(AppProfileUploadImageSuccessState());
        // print(value);
        profileImageURL = value;
      }).catchError((err) {
        emit(AppProfileUploadImageErrorState());
      });
    }).catchError((err) {
      emit(AppProfileUploadImageErrorState());
    });
  }

  String? coverImageURL;

  Future<void> uploadCoverImage() async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri
        .file(cover_image!.path)
        .pathSegments
        .last}').
    putFile(cover_image!).then((value) async
    {
      await value.ref.getDownloadURL().then((value) {
        emit(AppCoverUploadImageSuccessState());
        // print(value);
        coverImageURL = value;
      }).catchError((err) {
        emit(AppCoverUploadImageErrorState());
      });
    }).catchError((err) {
      emit(AppCoverUploadImageErrorState());
    });
  }

  Future<void> updateUser({
    required var name,
    required var bio,
    required var phone,
  }) async
  {
    emit(AppUserUpdatingState());


    if (cover_image == null && profile_image == null &&
        name == user_model!.name && phone == user_model!.phone &&
        bio == user_model!.bio) {
      emit(AppUserUpdateErrorState());
      return;
    }

    if (cover_image != null) {
      await uploadCoverImage();
    }

    if (profile_image != null) {
      await uploadProfileImage();
    }

    if (name == user_model!.name) {
      name = null;
    }

    if (phone == user_model!.phone) {
      phone = null;
    }

    if (bio == user_model!.bio) {
      bio = null;
    }


    User_Model model = User_Model(
      name: name,
      phone: phone,
      bio: bio,
      image: profileImageURL,
      cover: coverImageURL,


    );

    FirebaseFirestore.instance.collection('users').doc(uId).
    update(model.toMap()).then((value) {
      if (name != user_model!.name || profile_image != null) {
        posts.forEach((ele) {
          if (ele.name == user_model!.name) {
            if (name != user_model!.name) {
              ele.name = name ?? ele.name;
            }

            if (profile_image != null) {
              ele.image = profileImageURL;
            }
          }
        });
      }


      getUserData().then((value) {
        cover_image = null;
        coverImageURL = null;
        profile_image = null;
        profileImageURL = null;


        emit(AppUserUpdateSuccessState());
      });
    }).catchError((err) {
      emit(AppUserUpdateErrorState());
      print(err.toString());
    });
  }


  // ==========> 3 - Posts Section <==========

  // 3.1 - Create Post

  File? postImage;

  Future getPostImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null) {
      postImage = File(pickedImage.path);

      emit(AppPostImagePickedSuccessState());
    }
    else {
      // print('No Image Selected !');
      emit(AppPostImagePickedErrorState());
    }
  }

  void cancelUploadedPostImage() {
    postImage = null;
    emit(AppCancelUploadedPostImageState());
  }

  String? postImageURL;

  Future<void> uploadPostImage() async
  {
    await firebase_storage.FirebaseStorage.instance.
    ref().child('users/${Uri
        .file(postImage!.path)
        .pathSegments
        .last}').
    putFile(postImage!).then((value) async
    {
      await value.ref.getDownloadURL().then((value) {
        emit(AppUploadPostImageSuccessState());

        postImageURL = value;
      }).catchError((err) {
        emit(AppUploadPostImageErrorState());
      });
    }).catchError((err) {
      emit(AppUploadPostImageErrorState());
    });
  }


  // posts

  Future<void> createPost({
    required String datetime,
    required String text,

  }) async
  {
    emit(AppCreatePostLoadingState());

    if (postImage != null) {
      await uploadPostImage();
    }

    Post_Model model = Post_Model(
      // name: user_model!.name,
      // image: user_model!.image,
      uId: uId,
      datetime: datetime,
      text: text,
      postImage: postImageURL ?? '',

    );

    await FirebaseFirestore.instance.collection('posts').
    add(model.toMap()).then((value) {
      Post_Model newPost = Post_Model(
          uId: uId,
          postId: value.id,
          datetime: datetime,
          text: text,
          image: user_model!.image,
          name: user_model!.name,
          postImage: postImageURL ?? '',
          likes: 0,
          isLiked: false,
          commentsCount: 0

      );

      posts.insert(0, newPost);
      // myPosts.insert(0, newPost);

      emit(AppCreatePostSuccessState());
    }).catchError((err) {
      emit(AppCreatePostErrorState());
    });
  }


  //Get Posts 3.2

  List<Post_Model> posts = [];

  Future<void> getPosts() async
  {



    posts = [];
    Map<String, dynamic> postData = {};

    await FirebaseFirestore.instance.collection('posts').orderBy(
        'datetime', descending: true).get().then((value) async
    {
      await Future.forEach(value.docs, (ele) async
      {
        await FirebaseFirestore.instance.collection('users')
            .doc(ele['uId'])
            .get()
            .then((value) {
          postData['name'] = value.data()!['name'];
          postData['image'] = value.data()!['image'];
        });

        //likes
        await ele.reference.collection('likes').get().then((likesValues) async
        {
          if (likesValues.docs.isEmpty) {
            postData['likes'] = 0;
            postData['isLiked'] = false;
          }
          else {
            postData['likes'] = likesValues.docs.length;
          }


          await Future.forEach(likesValues.docs, (likeEle) {
            if (likeEle.reference.id == uId) {
              postData['isLiked'] = likeEle.data()['like'];
            } else {
              postData['isLiked'] = false;
            }
          }).then((value) async
          {
            //comments
            await ele.reference.collection('comments').get().then((
                commentsValues) async
            {
              postData['commentsCount'] =
              commentsValues.docs.isEmpty ? 0 : commentsValues.docs.length;
            }).then((value) {
              postData['postId'] = ele.id;
              postData.addAll(ele.data());

              posts.add(Post_Model.fromJson(postData));
              emit(AppGetPostSuccessState());
              // print(postData);
            });
          });
        });
      }).then((value) {
        emit(AppGetAllPostsSuccessState());
      });
    }).catchError((err) {
      emit(AppGetPostsErrorState(error: err.toString()));
      print(err.toString());
    });
  }

  List<Post_Model> userPosts = [];

  void getUserPosts(String uid)
  {
    userPosts = [];
    for(int x = 0 ; x < posts.length ; x++)
    {
      if(posts[x].uId == uid)
      {
        userPosts.add(posts[x]);
      }
    }
  }


  void likePost({
    required String postID
  }) {
    bool isLike = true;
    int eleIndex = 0;

    for (int x = 0; x < posts.length; x ++) {
      if (posts[x].postId == postID) {
        eleIndex = x;

        if (posts[x].isLiked == false) {
          posts[x].likes = posts[x].likes! + 1;
          posts[x].isLiked = true;
        }
        else {
          posts[x].likes = posts[x].likes! - 1;
          posts[x].isLiked = false;
          isLike = false;
        }
      }
    }

    emit(AppLikePostSuccessState());

    FirebaseFirestore.instance.
    collection('posts')
        .doc(postID)
        .collection('likes')
        .doc(uId)
        .set({
      'like': isLike
    })
        .then((value) {}).catchError((err) {
      if (posts[eleIndex].isLiked == false) {
        posts[eleIndex].likes = posts[eleIndex].likes! + 1;
        posts[eleIndex].isLiked = true;
      }
      else {
        posts[eleIndex].likes = posts[eleIndex].likes! - 1;
        posts[eleIndex].isLiked = false;
        isLike = false;
      }

      emit(AppLikePostErrorState(err.toString()));
    });
  }


  Future<void> commentPost({
    required String postID,
    required String commentText,
    required String datetime,
  }) async
  {
    emit(AppCommentPostLoadingState());

    Comment_Model model = Comment_Model(
        uId: uId,
        datetime: datetime,
        commentText: commentText
    );

    await FirebaseFirestore.instance.collection('posts')
        .doc(postID)
        .collection('comments')
        .add(model.toMap()).then((value) async
    {
      //increase number of comments on feeds screen

      increaseDecreasePostCommentCount(
          postId: postID,
          isIncrease: true
      );
      await getPostComments(postID: postID, firstTimeFlag: false);
    }).catchError((err) {
      emit(AppCommentPostErrorState(err.toString()));
    });
  }

  bool hasComments = false;
  List<Comment_Model> postComments = [];

  Future<void> getPostComments({
    required String postID,
    bool firstTimeFlag = true
  }) async
  {
    postComments = [];

    Map<String, dynamic> defaultModel = {};

    if (firstTimeFlag) {
      emit(AppGetCommentPostLoadingState());
    }

    await FirebaseFirestore.instance.collection('posts')
        .doc(postID).collection('comments').orderBy(
        'datetime', descending: false).get().then((value) async
    {
      await Future.forEach(value.docs, (element) async
      {
        defaultModel['datetime'] = element['datetime'];
        defaultModel['commentText'] = element['commentText'];
        defaultModel['commentId'] = element.id;

        if (element['uId'] == uId) {
          defaultModel['isMyComment'] = true;
        }
        else {
          defaultModel['isMyComment'] = false;
        }


        await FirebaseFirestore.instance.collection('users')
            .doc(element['uId'])
            .get()
            .then((value) {
          defaultModel['userName'] = value.data()!['name'];
          defaultModel['userImage'] = value.data()!['image'];
        });
        hasComments = true;
        postComments.add(Comment_Model.fromJson(defaultModel));
      }).then((value) {
        emit(AppGetCommentPostSuccessState());
      }).catchError((err) {
        emit(AppGetCommentPostErrorState(err.toString()));
      });
    });
  }

  void increaseDecreasePostCommentCount({
    required String postId,
    required bool isIncrease,
  }) {
    posts.forEach((postEle) {
      if (postEle.postId == postId) {
        print('ttttttttttttttttttttttt');
        if (isIncrease) {
          postEle.commentsCount = postEle.commentsCount! + 1;
        }
        else {
          postEle.commentsCount = postEle.commentsCount! - 1;
        }
        print('vvvvvvvvvvvvvvvvvvvvvvvvv');
        print(postEle.commentsCount);

        return;
      }
    });
  }

  Future<void> deleteComment({
    required String postId,
    required String commentId
  }) async
  {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .delete()
        .then((value) {
      late Comment_Model itemToRemove;

      postComments.forEach((element) {
        if (element.commentId == commentId) {
          itemToRemove = element;
          return;
        }
      });
      postComments.remove(itemToRemove);
      if(postComments.isEmpty)
      {
        hasComments = false;
      }
      increaseDecreasePostCommentCount(
          postId: postId,
          isIncrease: false
      );

      emit(AppDeleteCommentPostSuccessState());
    })
        .catchError((err) {
      emit(AppDeleteCommentPostErrorState(err.toString()));
      print(err.toString());
    });
  }

  // ==========> 4 - Chat Section <==========

  // 4.1 - Get all users
  List<User_Model> users = [];

  void getUsers()
  {
    if (users.isEmpty)
    {
      FirebaseFirestore.instance.collection('users').limit(10).where('uId',isNotEqualTo: uId).get().then((value)
      {
        value.docs.forEach((ele) {
          // if (ele.data()['uId'] != uId)
          // {
            users.add(User_Model.fromJson(ele.data()));
            searchUsersList.add(User_Model.fromJson(ele.data()));
          // }


        });

        emit(AppGetAllUsersSuccessState());
      }).catchError((err) {
        emit(AppGetAllUsersErrorState(error: err.toString()));
      });
    }
  }



  Future<void> getUsersChatWith() async {
    await FirebaseFirestore.instance.collection("Orders/$uId/Products").get()

        .then((QuerySnapshot snapshot) {
      final docs = snapshot.docs;
      for (var data in docs) {
        print(data.data());
        print(data.reference);
      }
    }).catchError((err)
    {
      print(err.toString());
    });
  }
  //Get Users that i chats with only
  List<User_Model> usersChatWith = [];

  Future<void> getUsersChatWitht() async
  {
    // if (users.isEmpty) {
    print('x');
    print(uId);

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc)
      {

        FirebaseFirestore.instance
            .doc(doc.id)
            .collection("chat")
            .get()
            .then((val)
        {
          print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
          print(val.docs.length);
        });
      });
    });

    await FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .collection('chat').get().then((value)
    {
      print('f');
      print(value.docs.length);
      value.docs.forEach((element)
      {
        print(element);
      });
    });
    print('u');
      // FirebaseFirestore.instance.collection('users').doc(uId).collection('chat').get().then((value)
      // {
      //   value.docs.forEach((ele)
      //   {
      //     print('y');
      //    print(ele.data());
      //     print('z');
      //     emit(AppGetUsersChatWithSuccessState());
      //   });
      //   print('a');
      //
      //
      // }).catchError((err) {
      //   emit(AppGetUsersChatWithErrorState(error: err.toString()));
      // });
    // }
  }

  //Search for specific user by userName
  List<User_Model> searchUsersList = [];

  void searchForUser(String userName)
  {
    searchUsersList = [];

    if(userName.isEmpty)
    {
      emit(ApptxtSearchChangedState());
      return;
    }


    FirebaseFirestore
        .instance
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: userName)
        .where('name', isLessThan: userName +'z')
        .get()
        .then((value)
    {
      value.docs.forEach((element)
      {
        if (element.data()['uId'] != uId)
        {
          searchUsersList.add(User_Model.fromJson(element.data()));
        }

        emit(AppSearchSuccessState());

      });

      print(searchUsersList.length);
    }).catchError((err){
      print(err.toString());
      emit(AppSearchErrorState(error: err.toString()));
    });
  }

  // 4.1 - Send Message
  Future<void> sendMessage({
    required String receiverId,
    required String datetime,
    required String text,
  }) async
  {
    Message_Model model = Message_Model(
        text: text,
        senderId: uId,
        receiverId: receiverId,
        datetime: datetime
    );

    //Set my chat
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chat')
        .doc(receiverId)
        .collection('messages')
        .add(
        model.toMap()).then((value) async
    {
      await FirebaseFirestore.instance.collection('users').doc(receiverId).get().then((value) async
      {
        User_Model uModel = User_Model.fromJson(value.data()!);

        print('88888888888888888888888888888888');
        print(value.data());

        if (value.data()!['FCM_token'].isNotEmpty) {
          Notification_Model notification_model = Notification_Model(
            user_FCM_Token: uModel.FCM_token!,
            type: 'chat',
            value: uId!,

          );
          print('2222222222222222222222222222222222222');
          print(notification_model.toMap());
          await DioHelper.post(
              data: notification_model.toMap()
          );
        }
      });


      // await getUserDataByUid(uId: uId!).then((value) async
      //  {
      //    print('99999999999999999999999999999999');
      //    print(value!.toMap());
      //
      //


      emit(AppSendMessageSuccessState());
      // });


    }).catchError((err) {
      emit(AppSendMessageErrorState());
      print(err.toString());
    });

    //Set receiver chat
    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chat')
        .doc(uId)
        .collection('messages')
        .add(
        model.toMap()).then((value) {
      emit(AppSendMessageSuccessState());
    }).catchError((err) {
      emit(AppSendMessageErrorState());
    });
  }


  // 4.2 - Get Messages

  List<Message_Model> messages = [];

  void getMessages({
    required String receiverId
  }) {
    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .collection('chat')
        .doc(receiverId)
        .collection('messages')
        .orderBy('datetime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((ele) {
        messages.add(Message_Model.fromJson(ele.data()));
      });


      emit(AppGetMessagesSuccessState());
    });
  }

  Future<User_Model> getUserModelById(String uid) async
  {
    late User_Model model;

    await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value)
    {
      model = User_Model.fromJson(value.data()!);
    });

    return model;

  }



}