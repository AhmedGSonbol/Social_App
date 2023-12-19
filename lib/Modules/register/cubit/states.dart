import 'package:social_app/Models/Login_Model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends RegisterStates {
  // final String uId;
  //
  // CreateUserSuccessState({required this.uId});

}

class CreateUserErrorState extends RegisterStates{
  final String error;

  CreateUserErrorState(this.error);
}

class RegisterSecureState extends RegisterStates{}