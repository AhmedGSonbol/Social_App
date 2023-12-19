import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/cubit/cubit.dart';

const DefaultColor = Colors.blue ;

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