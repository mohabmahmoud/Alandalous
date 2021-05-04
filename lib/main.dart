
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants/Colors.dart';
import 'Ui/TestSplash.dart';
import 'styles/apptheme.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        theme:appTheme.apptheme,home:SplashTest(),
        debugShowCheckedModeBanner: false,
      )

  );


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: PrimaryColor,
  ));



}



















