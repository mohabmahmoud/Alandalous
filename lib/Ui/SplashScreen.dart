import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/HomeScreen/Home.dart';
import 'package:flutter/services.dart';
import 'package:your_splash/your_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'OnBoarding.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>  with TickerProviderStateMixin {
  void initState() {
    declear();
    super.initState();



  }
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    // it starts the animation
    return SplashScreen.timed(
      seconds: 3,
      route: PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {


              return OnBoarding();


          },
          transitionDuration: Duration(seconds: 3),
          transitionsBuilder: (_, animation, secAnim, child) {
            var tween = Tween(begin: 0.0, end: 1.0).chain(
              CurveTween(curve: Curves.easeInExpo),
            );
            return FadeTransition(
                opacity: animation.drive(tween), child: child);
          }),
      body: Scaffold(backgroundColor: Theme.of(context).primaryColor,
        body: Container(alignment: Alignment.center,child: Image.asset('images/logo.png',
          height: getheight(context)/5,color: Theme.of(context).accentColor,),),
      ),
    );
  }

  declear()async{
    prefs=await SharedPreferences.getInstance();

  }

}