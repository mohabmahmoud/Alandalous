import 'package:alandalous/Constants/Colors.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Drawer/mydrawer.dart';
import 'package:alandalous/Ui/AddOrder/AllCat_Orders.dart';
import 'package:alandalous/Ui/Cards/AllCards.dart';
import 'package:alandalous/Ui/Category/AllCategrios.dart';
import 'package:alandalous/Ui/HomeScreen/Home.dart';
import 'package:alandalous/Ui/Money/MyPoints.dart';
import 'package:alandalous/Ui/More/More_Screen.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';
import '../../Constants/ClassNavigator.dart';

import '../AllProducts.dart';
import '../AllStoresMap.dart';
import '../AllAcounts/AllWorks.dart';
import '../about.dart';

class Controller extends StatefulWidget {
  bool lang;
  Controller(this.lang);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {


  List<Widget> Pages=[HomePage(true),AllCategrios(true),AllCards(),AllWorks(),More_Screen()];

  int index=0;

  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child:
    AnimatedDrawer(
        homePageXValue: -getwidth(context)*2/3,
        homePageYValue: 0,
        homePageAngle: 0.0,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 120,
        shadowAngle: 0.275,
        shadowSpeed: 200,
        openIcon: Icon(Icons.menu, color:Colors.white),
        closeIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
        shadowColor: Theme.of(context).primaryColor,
        backgroundGradient: LinearGradient(
          colors: [Theme.of(context).primaryColor,Theme.of(context).primaryColor],
        ),
        menuPageContent: myDrawer(context,''),
        homePageContent:
    Scaffold(body:
    IndexedStack(children:Pages,index:index,),
      bottomNavigationBar:

      BottomNavigationBar(backgroundColor: Colors.white,selectedItemColor: Colors.grey,unselectedItemColor: Colors.grey,onTap: (int i){

        setState(() {

          index=i;
        });
      },currentIndex: index,items: [
        BottomNavigationBarItem(icon: Image.asset('images/Bottom/home.png',height: getheight(context)/35,),title:Text('الرئسية',style: TextStyle(fontSize: 11,fontWeight:FontWeight.w600),)),
        BottomNavigationBarItem(icon: Image.asset('images/Bottom/category1.png',height: getheight(context)/35,color: Colors.blue.shade400,),title:Text('الاقسام',style: TextStyle(fontSize: 11,fontWeight:FontWeight.w600),)),
        BottomNavigationBarItem(icon: Image.asset('images/Bottom/offers.png',height: getheight(context)/35,),title:Text('مميزتنا',style: TextStyle(fontSize: 11,fontWeight:FontWeight.w600),)),
        BottomNavigationBarItem(icon: Image.asset('images/Bottom/more.png',height: getheight(context)/35,),title:Text('المزيد',style: TextStyle(fontSize: 11,fontWeight:FontWeight.w600),)),
        BottomNavigationBarItem(icon: Image.asset('images/Bottom/morer.png',height: getheight(context)/35,),title:Text('المزيد',style: TextStyle(fontSize: 11,fontWeight:FontWeight.w600),)),

      ],)

    )
    ));
  }
}
