import 'dart:async';

import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/LOGIN.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'Controller/Controller.dart';
import 'HomeScreen/Home.dart';
class SplashTest extends StatefulWidget {
  SplashTest();

  @override
  _SplashTestState createState() => _SplashTestState();
}

class _SplashTestState extends State<SplashTest> {
  @override
  void initState() {
    const duartion1=Duration(milliseconds: 700);
    new Timer(duartion1,(){
      _toggle();
    });
    super.initState();
  }
  bool loading=true;
  bool open=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        ListView(physics: NeverScrollableScrollPhysics(),children: [
          AnimatedContainer(alignment: Alignment.center,height:(open)?getheight(context)/3: getheight(context),
            duration:Duration(seconds: 1) ,
            color: Theme.of(context).primaryColor,child: Center(child:
            AnimatedOpacity(
                opacity:loading ? 0 : 1,
                duration: Duration(milliseconds: 1300),
                child:
                Image.asset('images/logo.png',
                  color:
                  Theme.of(context).accentColor,width:
                  getwidth(context)/3+30,)),


            ),
          ),
          Container(height:getheight(context)*2/3 ,child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Image.asset("images/1_onboard.png", height: getheight(context)/3),
                ListTile(title:
                Text('الأندلس للتقسيط',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18,fontWeight:
                FontWeight.bold,color: Theme.of(context).primaryColor),),
                    subtitle:
                    Text('الحياة اسهل بكتير',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,fontWeight:
                      FontWeight.bold,color:Colors.grey),)





                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    GestureDetector(
                    onTap: (){
                      Showmytoast('mohab', context);
                      Navigator.push(context, SecondPageRoute(LoginScreen()));


                    },
            child: Container(
              height: getheight(context) / 13,
              width: getwidth(context)/2-25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
              ),
              child:
              Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ),
          ),
                    GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, SecondPageRoute(Controller(true)));

                    },
            child:
            Container(
              height: getheight(context) / 13,
              width: getwidth(context)/2-25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
               border: Border.all(color: Theme.of(context).primaryColor,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
              ),
              child:
              Text(
                'دخول للتطبيق',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700, color:Theme.of(context).primaryColor),
              ),
            ),
          ),


                ],),
                Container(),
                Container(),

              ],)


          )




        ],)

    );
  }
  _toggle() {

    setState(() {
      loading = !loading;
    });
    const duartion1=Duration(seconds: 2);
    new Timer(duartion1,(){
      setState(() {
        open=!open;
      });
    });

  }
}
