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

class GoogleLoginLoadingState extends LoginStates{}

class GoogleLoginSuccessState extends LoginStates{
  final String uId;

  GoogleLoginSuccessState(this.uId);
}

class GoogleLoginErrorState extends LoginStates{}


class FacebookLoginLoadingState extends LoginStates{}

class FacebookLoginSuccessState extends LoginStates{
  final String uId;

  FacebookLoginSuccessState(this.uId);
}

class FacebookLoginErrorState extends LoginStates{}


class CreateUserSuccessState extends LoginStates{
  final String uId;

  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends LoginStates{
  final String error;

  CreateUserErrorState(this.error);
}

class LoginSecureState extends LoginStates{}