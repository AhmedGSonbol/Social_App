import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/Shared/Styles/colors.dart';

ThemeData darkTheme = ThemeData(

  primarySwatch: defaultColor,

  appBarTheme: AppBarTheme(
    //Control Status bar

      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkColor,
          statusBarIconBrightness: Brightness.light),
      /////////////////////
      titleSpacing: 20.0,
      backgroundColor: darkColor,
      elevation: 0.0,
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
    unselectedItemColor: Colors.white,
    selectedLabelStyle: TextStyle(color: Colors.orange, fontSize: 15.0),
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
  ),

    fontFamily: 'Jannah',

);


ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
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
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Jannah',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black)),
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      selectedLabelStyle:
      TextStyle(color: Colors.orange, fontSize: 15.0),
      elevation: 20.0),
  textTheme:const TextTheme(
    titleMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      height: 1.3
    ),

  ),
  fontFamily: 'Jannah',
);