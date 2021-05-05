
import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/AllStoresMap.dart';
import 'package:alandalous/Ui/AllAcounts/AllWorks.dart';
import 'package:alandalous/Ui/Cards/CardPage.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Ui/about.dart';
import '../main.dart';

myDrawer(BuildContext context,String token){

  return
  Scaffold( bottomNavigationBar: Container(height: getheight(context)/13,padding: EdgeInsets.only(right: 8,bottom:10,left: getwidth(context)/3+8),child:
  RaisedButton(color: Theme.of(context).accentColor,onPressed: (){


  },child: Text('تسجيل الخروج',style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),)),backgroundColor: Theme.of(context).primaryColor,body:
  Padding(child:Directionality(textDirection: TextDirection.rtl,child:ListView(children: [
    SizedBox(height: getheight(context)/20,),
    Container(width: getwidth(context)/2,child:
Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [

  Image.asset('images/money.png',height:getwidth(context)/8 ,width: getwidth(context)/8,color: Colors.white,),
  Text('الرصيد الحالى',style: TextStyle(color: Theme.of(context).accentColor),),
  Text('1000 جنية ',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Theme.of(context).accentColor),),



],)


),
    SizedBox(height: 5,),
    Container(child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      MoneyView( context, 'مستقطعات', 500),
      Container(height: 40,width: 2,color: Theme.of(context).accentColor,),
      MoneyView( context, 'مفردات المرتب', 500),

    ],),),
    Drawer_ListItem( 'تفاصيل الرصيد',Icons.monetization_on_rounded,context),
    Drawer_ListItem( ' إحصائيات اسبوعية',Icons.stacked_line_chart_sharp,context),






  ],)),

  padding: EdgeInsets.only(left: getwidth(context)/3),),)
  ;
  
  
}


Widget Drawer_ListItem(String name,var icon,BuildContext context){

  return Column(children: [



    InkWell(onTap: (){
      Navigator.push(context, SecondPageRoute(About()));

    },child: Row(children: [
      SizedBox(width: 10,),

      Icon(icon,size: 20,color: Theme.of(context).accentColor,),
      SizedBox(width: 8,),

      Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),)
    ],),),
    SizedBox(height: 10,),
    Divider(height: 7,),
  ],);

}


Container MoneyView(BuildContext context,String name,double money){
  return Container(width: getwidth(context)/3-5,child: ListTile(title: Text(name,textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 13),),
    subtitle: Text('${money} جنية',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),),
  ));

}