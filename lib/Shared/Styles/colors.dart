import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/Shared/cubit/cubit.dart';


const defaultColor = Colors.blue ;

final darkColor =  HexColor('#333739');

Color fontColor(context)
{
  if(AppCubit.get(context).isDarkMode)
  {
    return Colors.white;
  }
  else
  {
    return Colors.black;
  }
}

Color backgroundColor(context)
{
  if(AppCubit.get(context).isDarkMode)
  {
    return darkColor;
  }
  else
  {
    return Colors.white;
  }
}