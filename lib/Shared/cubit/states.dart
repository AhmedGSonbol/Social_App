
abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppGetUserLoadingState extends AppStates{}

class AppGetUserSuccessState extends AppStates{}

class AppGetUserErrorState extends AppStates{
  final String error;

  AppGetUserErrorState({required this.error});
}

class AppEmailVerifiedState extends AppStates{}


class AppGetAllUsersLoadingState extends AppStates{}

class AppGetAllUsersSuccessState extends AppStates{}

class AppGetAllUsersErrorState extends AppStates{
  final String error;

  AppGetAllUsersErrorState({required this.error});
}

class AppGetUsersChatWithLoadingState extends AppStates{}

class AppGetUsersChatWithSuccessState extends AppStates{}

class AppGetUsersChatWithErrorState extends AppStates{
  final String error;

  AppGetUsersChatWithErrorState({required this.error});
}

class ApptxtSearchChangedState extends AppStates{}

class AppSearchSuccessState extends AppStates{}

class AppSearchErrorState extends AppStates{
  final String error;

  AppSearchErrorState({required this.error});
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
  // String err;
  // AppUserUpdateErrorState(this.err);

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
class AppGetPostSuccessState extends AppStates{}

class AppGetAllPostsSuccessState extends AppStates{}

class AppGetPostsErrorState extends AppStates{
  final String error;

  AppGetPostsErrorState({required this.error});
}


//Post Likes
class AppLikePostSuccessState extends AppStates{}

class AppLikePostErrorState extends AppStates{
  final String error;

  AppLikePostErrorState(this.error);
}

//Post Comments
class AppCommentPostLoadingState extends AppStates{}

class AppCommentPostErrorState extends AppStates{
  final String error;

  AppCommentPostErrorState(this.error);
}

class AppGetCommentPostLoadingState extends AppStates{}

class AppGetCommentPostSuccessState extends AppStates{}

class AppGetCommentPostErrorState extends AppStates{
  final String error;

  AppGetCommentPostErrorState(this.error);
}

class AppDeleteCommentPostSuccessState extends AppStates{}

class AppDeleteCommentPostErrorState extends AppStates{
  final String error;

  AppDeleteCommentPostErrorState(this.error);
}

//Chat
class AppSendMessageSuccessState extends AppStates{}

class AppSendMessageErrorState extends AppStates{}

class AppGetMessagesSuccessState extends AppStates{}


class AppInternetConnectionSuccessState extends AppStates{}

class AppInternetConnectionFaildState extends AppStates{}


class AppChangeAppLangState extends AppStates{}

class AppChangeAppModeState extends AppStates{}


class AppGetUserPostsState extends AppStates{}
