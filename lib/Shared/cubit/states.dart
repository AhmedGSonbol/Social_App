
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

class AppProfileUploadImageSuccessState extends AppStates{}

class AppProfileUploadImageErrorState extends AppStates{}

class AppCoverUploadImageSuccessState extends AppStates{}

class AppCoverUploadImageErrorState extends AppStates{}

class AppUserUpdatingState extends AppStates{}

class AppUserUpdateSuccessState extends AppStates{}

class AppUserUpdateErrorState extends AppStates{
  String err;
  AppUserUpdateErrorState(this.err);

}

class AppCancelUploadedProfileImageState extends AppStates{}

class AppCancelUploadedCoverImageState extends AppStates{}


//Create Post
class AppUploadPostImageSuccessState extends AppStates{}

class AppUploadPostImageErrorState extends AppStates{}

class AppCreatePostLoadingState extends AppStates{}

class AppCreatePostSuccessState extends AppStates{}

class AppCreatePostErrorState extends AppStates{}

class AppPostImagePickedSuccessState extends AppStates{}

class AppPostImagePickedErrorState extends AppStates{}

class AppCancelUploadedPostImageState extends AppStates{}


//Get Posts States
class AppGetPostsLoadingState extends AppStates{}

class AppGetPostsSuccessState extends AppStates{}

class AppGetPostsErrorState extends AppStates{
  final String error;

  AppGetPostsErrorState({required this.error});
}