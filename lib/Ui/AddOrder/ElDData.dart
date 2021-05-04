import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';

import 'AddOrder_EditText.dart';
class ElDData extends StatefulWidget {
  bool lang;
  ElDData(this.lang);
  @override
  _ElDDataState createState() => _ElDDataState();
}

class _ElDDataState extends State<ElDData> {
  TextEditingController Name=new TextEditingController();
  TextEditingController Address=new TextEditingController();
  TextEditingController Id=new TextEditingController();
  TextEditingController Phone=new TextEditingController();
  TextEditingController Anther_Phone=new TextEditingController();
  TextEditingController Job=new TextEditingController();
  TextEditingController MainStreet=new TextEditingController();
  TextEditingController BStreet=new TextEditingController();
  TextEditingController BuildNum=new TextEditingController();
  TextEditingController DoorNum=new TextEditingController();
  TextEditingController Mark=new TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:Container(height: 70,

            child:Padding(padding: EdgeInsets.all(10),

                child:RaisedButton(color: Theme.of(context).primaryColor,onPressed: (){

                },child: Text('اضافة الاستمارة',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
            )
        ) ,

        appBar: AppBar(title: Text('بيانات الضامن'),),

        body: Directionality(textDirection: TextDirection.rtl,child:Padding(padding: EdgeInsets.all(10),child:
        ListView(children: [

          SizedBox(height: 10,),
          Text('بيانات الشخصية',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),

          AddOrder_EditText( 'اسم رباعي', context, Name),
          AddOrder_EditText( 'الرقم القومي', context, Id),
          AddOrder_EditText( 'رقم الموبايل', context, Phone),
          AddOrder_EditText( 'رقم الموبايل اضافي', context, Anther_Phone),
          AddOrder_EditText( 'وظيفة العميل', context, Job),
          SizedBox(height: 10,),
          Text('بيانات المكان',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),



          Container(
            decoration:
            BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 2,color: Theme
                    .of(context)
                    .primaryColor)),
            height: getheight(context)/15,
            child:FlatButton(child: Text('اختيار المنطقة',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),onPressed: (){


            },),
          ),
          SizedBox(height: 10,),

          AddOrder_EditText( 'الشارع الرئيسى', context, MainStreet),
          AddOrder_EditText( 'الشارع الفرعي', context, BStreet),
          AddOrder_EditText( 'رقم المبني', context, BuildNum),
          AddOrder_EditText( ' رقم الدور', context, DoorNum),
          AddOrder_EditText( 'علامة مميزة للعنوان', context, Mark),








        ],),
        )));
  }
}
