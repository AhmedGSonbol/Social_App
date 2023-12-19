import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Login_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/login/cubit/states.dart';
import 'package:social_app/Modules/register/cubit/states.dart';
import 'package:social_app/Network/Remote/dio_Helper.dart';
import 'package:social_app/Network/end_points.dart';
import 'package:social_app/cubit/cubit.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late Login_Model loginModel;

  bool isSecure = true;

  IconData passIcon = Icons.visibility_off;

  void userRegister(context,{
    required String email ,
    required String Password,
    required String name,
    required String phone
  })
  {
    emit(RegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: Password
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
    });
  }


  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId
})
  {

    User_Model model = User_Model(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVrified: false
    );


    FirebaseFirestore.instance.collection('users').doc(uId).set(
      model.toMap()
    ).then((value)
    {
      emit(CreateUserSuccessState());
    }).catchError((err)
    {
      emit(CreateUserErrorState(err.toString()));
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