import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/Login_Model.dart';

import 'package:social_app/Network/Local/Cach_Helper.dart';
import 'package:social_app/Network/Remote/dio_Helper.dart';
import 'package:social_app/Network/end_points.dart';
import 'package:social_app/components/Components.dart';
import 'package:social_app/components/constants.dart';
import 'package:social_app/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialState());


  static AppCubit get(context) => BlocProvider.of(context);


  int current_index = 0;

  // List<Widget> bottomScreens =
  // [
  //   Products_Screen(),
  //   Categories_Screen(),
  //   Favorites_Screen(),
  //   Settings_Screen(),
  // ];

  void changeBottom(int index)
  {
    if(!isBottomSheetShow)
    {
      current_index = index;
      emit(ChangeBottomNavState());
    }

  }

  bool isDarkMode = false;

  void changeDarkMode()
  {
    isDarkMode = !isDarkMode;
    CachHelper.saveData(key: 'isdarkmode', value: isDarkMode).then((value)
    {
      emit(ChangeAppModeState());

    });
  }

  bool isEnglish = true;

  void changeLang()
  {
    isEnglish = !isEnglish;
    CachHelper.saveData(key: 'isEnglish', value: isEnglish).then((value)
    {
      emit(ChangeAppLangState());

      refresh();

    });
  }

  void refresh()
  {
    // getHomeData();
    // getCategoriesData();
    // getFavoritesData();
    // getCartItems();
    getUserData();
  }

  String getDioLang()
  {
    if(isEnglish == true)
    {
      return 'en';
    }
    else
    {
      return 'ar';
    }


  }





  Login_Model? user_model;
  void getUserData()
  {
    emit(LoadingUserDataState());

    DioHelper.getData(
      url: PROFILE ,
      token: token,
      lang: getDioLang(),
    )!.then((value)
    {
      user_model = Login_Model.fromJson(value.data);

    //  printFullText(user_model!.data!.name.toString());

      emit(SuccessUserDataState(user_model!));
    }).catchError((err)
    {
      emit(ErrorUserDataState());
      print(err.toString());
    });

  }

  // void updateUserData({required String name,required String email,required String phone,required String password,})
  // {
  //   emit(ShopLoadingUpdateUserDataState());
  //
  //   DioHelper.putData(
  //     url: UPDATE ,
  //     token: token,
  //       lang: getDioLang(),
  //     data: {
  //       'name': name,
  //       'phone' : phone,
  //       'email' : email,
  //       'password' : password,
  //
  //     }
  //   )!.then((value)
  //   {
  //     user_model = Shop_Login_Model.fromJson(value.data);
  //
  //     //  printFullText(user_model!.data!.name.toString());
  //
  //     emit(ShopSuccessUpdateUserDataState(user_model!));
  //   }).catchError((err)
  //   {
  //     emit(ShopErrorUpdateUserDataState());
  //     print(err.toString());
  //   });
  //
  // }



 // int cartItemsCount = 0;



  bool isBottomSheetShow = false;

  void changeBottomSheet(bool isVisible)
  {
    isBottomSheetShow = isVisible;
    emit(ChangeBottomSheetState());

  }






}

