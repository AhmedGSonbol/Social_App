import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/Shared/Styles/colors.dart';

ThemeData darkTheme = ThemeData(

  primarySwatch: defaultColor,

  colorScheme: ColorScheme.fromSwatch(),

  appBarTheme: AppBarTheme(
    //Control Status bar

      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkColor,
          statusBarIconBrightness: Brightness.light,

      ),
      /////////////////////
      titleSpacing: 20.0,
      backgroundColor: darkColor,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      titleTextStyle:const TextStyle(
        color: Colors.white,
        fontFamily: 'Jannah',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,

      ),

      iconTheme:const IconThemeData(color: Colors.white)),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.white70,
    selectedLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15.0),
    elevation: 20.0,
    backgroundColor: darkColor,

  ),

  scaffoldBackgroundColor: darkColor,

  textTheme:const TextTheme(
    titleMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.3
    ),
      bodySmall: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
          height: 1.3
      ),

    titleLarge: TextStyle(
        // fontSize: 13.0,
        // fontWeight: FontWeight.w600,
        color: Colors.white,
        // height: 1.3
    ),
  ),
  // iconTheme: IconThemeData(color: Colors.white),

  fontFamily: 'Jannah',



  useMaterial3: true,

  hintColor: Colors.white,

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 10.0,
  ),

  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.grey,

  ),


  cardTheme: CardTheme(
      color: Colors.grey.withOpacity(0.2),
      elevation: 0.0,
      // shadowColor: Colors.grey,
      surfaceTintColor: Colors.transparent


  ),




);


ThemeData lightTheme = ThemeData(

  primarySwatch: defaultColor,
  colorScheme: ColorScheme.fromSwatch(),
  // scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    //Control Status bar
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      /////////////////////
      titleSpacing: 20.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Jannah',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black)),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      selectedLabelStyle:
      TextStyle(color: Colors.orange, fontSize: 15.0),
      elevation: 20.0,
    backgroundColor: Colors.white
  ),

  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,

      color: Colors.white,
      elevation: 20.0,

      shadowColor:  Colors.grey.withOpacity(0.5),

      surfaceTintColor: Colors.transparent,


  ),

  textTheme:const TextTheme(
    titleMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      height: 1.3
    ),
    bodySmall: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
        height: 1.3
    ),


  ),
  fontFamily: 'Jannah',
  useMaterial3: true,
);