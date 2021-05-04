import 'package:alandalous/Constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/color.dart';
class appTheme{
  static ThemeData apptheme=ThemeData(
      primaryColor: PrimaryColor,
      accentColor:Colors.white,
      appBarTheme: AppBarTheme(brightness:Brightness.dark,
      centerTitle: true,
      elevation: 0.3,textTheme: TextTheme(title:
      TextStyle(fontSize: 16,fontFamily: 'mohab',color: Colors.white,fontWeight: FontWeight.bold)),
      iconTheme: IconThemeData(
        color:Colors.white,
      ),),
    fontFamily: 'mohab'

  );
}