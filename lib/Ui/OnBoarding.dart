import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/HomeScreen/Home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(body:
      IntroductionScreen(
      pages: [PageViewModel(
        bodyWidget: Text('الحياة اسهل بكتير قسط و احنا في دهرك',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color:Colors.grey),),
        titleWidget: Text('شركة الأندلس للتقسيط',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
        image: Center(
          child: Image.asset("images/1_onboard.png", height: getheight(context)/2),
        ),
      ),PageViewModel(
        titleWidget: Text('شركة الأندلس للتقسيط',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
        bodyWidget: Text('الحياة اسهل بكتير قسط و احنا في دهرك',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color:Colors.grey),),
        image: Center(
          child: Image.asset("images/1_onboard.png", height: getheight(context)/2),
        ),
      )


      ],
      onDone: () {
        Navigator.pushReplacement(context, SecondPageRoute(HomePage(true)));


      },
      onSkip: () {
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.navigate_next),
      done: const Text("انهاء", style: TextStyle(color:
      Colors.blue,
          fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor:Theme.of(context).primaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          )
      ),
    ));
  }
}
