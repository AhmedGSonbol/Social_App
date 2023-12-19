import 'package:social_app/Models/Login_Model.dart';


abstract class AppStates {}

class InitialState extends AppStates{}

class ChangeBottomNavState extends AppStates{}

class ChangeAppModeState extends AppStates{}

class ChangeAppLangState extends AppStates{}


class LoadingHomeDataState extends AppStates{}
class SuccessHomeDataState extends AppStates{}
class ErrorHomeDataState extends AppStates{}

class SuccessCategoriesDataState extends AppStates{}
class ErrorCategoriesDataState extends AppStates{}

class SuccessCategoriesDetailsDataState extends AppStates{}
class ErrorCategoriesDetailsDataState extends AppStates{}


class ChangeFavoritesState extends AppStates{}
class ErrorChangeFavoritesState extends AppStates{}

class SuccessGetFavoritesDataState extends AppStates{}
class ErrorGetFavoritesDataState extends AppStates{}
class LoadingFavoritesDataState extends AppStates{}

class LoadingUserDataState extends AppStates{}
class SuccessUserDataState extends AppStates {
  Login_Model user_Model;

  SuccessUserDataState(this.user_Model);

}
class ErrorUserDataState extends AppStates{}

class LoadingUpdateUserDataState extends AppStates{}
class SuccessUpdateUserDataState extends AppStates {
  Login_Model user_Model;

  SuccessUpdateUserDataState(this.user_Model);

}
class ErrorUpdateUserDataState extends AppStates{}

class LoadingCartItemsState extends AppStates{}
class SuccessCartItemsState extends AppStates{
  // Cart_Model cart_model;
  //
  // SuccessCartItemsState(this.cart_model);
}
class ErrorCartItemsState extends AppStates{}

class LoadingUpdateCartItemsState extends AppStates{}
class SuccessUpdateCartItemsState extends AppStates{
  // Cart_Model cart_model;
  //
  // SuccessUpdateCartItemsState(this.cart_model);
}
class ErrorUpdateCartItemsState extends AppStates{}

class ChangeBottomSheetState extends AppStates{}