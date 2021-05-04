
import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/AllStoresMap.dart';
import 'package:alandalous/Ui/AllWorks.dart';
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
    SizedBox(height: 20,),
    ListItem( context),
    ListItem( context),
    ListItem( context),
    ListItem( context),

    ListTile(leading: Icon(Icons.favorite_border,color: Colors.white,),title: Text('المفضلة',style: TextStyle(color: Colors.white,fontSize: 17),),),
    ListTile(onTap: (){

      Navigator.pop(context);
      Navigator.push(context, SecondPageRoute(AllWorks()));

    },leading: Icon(Icons.work_outline_outlined,color: Colors.white,),title: Text('حساباتك',style: TextStyle(color: Colors.white,fontSize: 17),),),
    ListTile(leading: Icon(Icons.monetization_on_rounded,color: Colors.white,),title: Text('رصيدك الحالي',style: TextStyle(color: Colors.white,fontSize: 17),),),
    ListTile(onTap: ()async{



    },leading: Icon(Icons.location_on_outlined,color: Colors.white,),title: Text('جميع فروعنا',style: TextStyle(color: Colors.white,fontSize: 17),),),





  ],)),

  padding: EdgeInsets.only(left: getwidth(context)/3),),)
  ;
  
  
}


Widget ListItem(BuildContext context){

  return Column(children: [


    SizedBox(height: 5,),

    InkWell(onTap: (){
      Navigator.push(context, SecondPageRoute(About()));

    },child: Row(children: [
      Icon(Icons.monetization_on_rounded,color: Theme.of(context).accentColor,),
      SizedBox(width: 8,),

      Text('عمليات الدفع و تفاصيل الرصيد',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),)
    ],),),
    SizedBox(height: 5,),
    Divider(height: 7,),
  ],);

}