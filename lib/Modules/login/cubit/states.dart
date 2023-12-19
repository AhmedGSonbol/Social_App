// import 'package:shopapp/Models/Login_Model.dart';

import 'package:social_app/Models/Login_Model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates{
  final String error;

  LoginErrorState(this.error);
}

class LoginSecureState extends LoginStates{}