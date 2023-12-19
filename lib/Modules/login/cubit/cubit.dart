import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Login_Model.dart';
import 'package:social_app/Modules/login/cubit/states.dart';
import 'package:social_app/Network/Remote/dio_Helper.dart';
import 'package:social_app/Network/end_points.dart';
// import 'package:social_app/cubit/cubit.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late Login_Model loginModel;

  bool isSecure = true;

  IconData passIcon = Icons.visibility_off;

  void userLogin(context,{required String Email , required String Password})
  {
    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email,
        password: Password).then((value)
    {
      emit(LoginSuccessState(value.user!.uid));

    }).catchError((err)
    {
      emit(LoginErrorState(err.toString()));
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
    emit(LoginSecureState());
  }

}