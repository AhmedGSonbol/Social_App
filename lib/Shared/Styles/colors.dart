import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


const defaultColor = Colors.blue ;

final darkColor =  HexColor('#333739');

Color fontColor(context)
{
  // if(AppCubit.get(context).isDarkMode)
  if(false)
  {
    return Colors.white;
  }
  else
  {
    return Colors.black;
  }
}