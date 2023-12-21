import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chats/chat_Screen.dart';
import 'package:social_app/Modules/feeds/feeds_Screen.dart';
import 'package:social_app/Modules/settings/settings_Screen.dart';
import 'package:social_app/Modules/users/users_Screen.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/cubit/states.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  User_Model? user_model;

  void getUserData()
  {
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value)
    {
      print(value.data());
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


}
