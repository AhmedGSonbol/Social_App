
abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppGetUserLoadingState extends AppStates{}

class AppGetUserSuccessState extends AppStates{}

class AppGetUserErrorState extends AppStates{
  final String error;

  AppGetUserErrorState({required this.error});
}

class AppChangeBottomNavState extends AppStates{}

class AppNewPostState extends AppStates{}

class AppProfileImagePickedSuccessState extends AppStates{}

class AppProfileImagePickedErrorState extends AppStates{}

class AppCoverImagePickedSuccessState extends AppStates{}

class AppCoverImagePickedErrorState extends AppStates{}