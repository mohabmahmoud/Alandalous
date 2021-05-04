import 'dart:async';
import 'package:alandalous/Ui/HomeScreen/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/ClassNavigator.dart';
import '../Constants/widthandheight.dart';
import '../Widgets/ButtonGotoForgetPassword.dart';
import '../Widgets/ButtonUi.dart';
import '../Widgets/TextFieldUi.dart';
import 'Signup_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool load = false;
  double opacity=0.0;
  TextEditingController email_controller ;
  TextEditingController password_controller;
  @override
  void initState() {
     email_controller = TextEditingController();
     password_controller = TextEditingController();
    setState(() {
      opacity=1;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      GotoForgetPassWord(),
      appBar: AppBar(elevation: 0.0,actions: [
        FlatButton(onPressed: () {
          Navigator.pushReplacement(context, SecondPageRoute(Signup(true)));

        }, child:
        Text('تسجيل جديد',
          style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),)




        )
      ],
        title: Text('تسجيل الدخول' ),
        ),
      body:


      Container(width: getwidth(context),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),

          child:
          Directionality(textDirection: TextDirection.rtl,child:
          Column(
            children: <Widget>[

              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: getheight(context) / 5,
                  width: getwidth(context),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  child: Center(child: Image.asset('images/logo.png',color: Theme.of(context).accentColor,
                    height: getheight(context) / 4 - 70,)),
                ),
              ),

              FormEditTextUi('البريد الاكتروني',email_controller,false,TextInputType.emailAddress,),
              FormEditTextUi(' كلمة المرور',password_controller,true,TextInputType.visiblePassword,),
              MainButtonsUi('تسجيل الدخول',() async {
                Navigator.pushReplacement(context, SecondPageRoute(HomePage(true)));


              },load)





            ],
          )),
        ),
      ),


    );
  }

}


