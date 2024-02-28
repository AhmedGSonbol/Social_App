import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Login_Model.dart';
import 'package:social_app/Models/user_Model.dart';

import 'package:social_app/Modules/register/cubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late Login_Model loginModel;

  bool isSecure = true;

  IconData passIcon = Icons.visibility_off;

  void userRegister(context,{
    required String email ,
    required String password,
    required String name,
    required String phone
  })
  {
    emit(RegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {

      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name
      );

      // emit(RegisterSuccessState());


    }).catchError((err){
      emit(RegisterErrorState(err.toString()));
      print(err.toString());
    });
  }


  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,

})
  {
    FirebaseMessaging.instance.getToken().then((TokenValue)
    {
      User_Model model = User_Model(
          name: name,
          email: email,
          phone: phone,
          uId: uId,
          isEmailVrified: false,
          bio: 'write your bio ...',
          image: 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg',
          cover: 'https://img.freepik.com/free-psd/3d-render-digital-communication-background_23-2150762212.jpg?w=740&t=st=1703180352~exp=1703180952~hmac=2e944def7da0d55bacc74364688bbbffdd81bdfff3eb2d69e7ad41279c484361',
          FCM_token: TokenValue
      );

      FirebaseFirestore.instance.collection('users').doc(uId).set(
          model.toMap()
      ).then((value)
      {

        emit(CreateUserSuccessState(uId: uId));


      }).catchError((err)
      {
        emit(CreateUserErrorState(err.toString()));
        print(err.toString());
      });
    });





  }


  void changePassVisibility()
  {
    isSecure =! isSecure;
    if(isSecure)
    {
      passIcon = Icons.visibility_off;
    }
    else
    {
      passIcon = Icons.visibility;
    }
    emit(RegisterSecureState());
  }

}