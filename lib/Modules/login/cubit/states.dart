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

class GoogleLoginErrorState extends LoginStates{
  final String error;

  GoogleLoginErrorState(this.error);
}


class CreateUserSuccessState extends LoginStates{
  final String uId;

  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends LoginStates{
  final String error;

  CreateUserErrorState(this.error);
}

class LoginSecureState extends LoginStates{}