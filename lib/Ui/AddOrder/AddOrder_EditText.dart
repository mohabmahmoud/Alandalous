import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
Widget AddOrder_EditText(String name,BuildContext context,TextEditingController controller){
  return Column(children: [

    Container(
      decoration:
      BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2,color: Theme
              .of(context)
              .primaryColor)),
      height: getheight(context)/13,
      child:

      Row(crossAxisAlignment: CrossAxisAlignment.center,children: [
        Padding(padding: EdgeInsets.only(left: 7,right: 7),child:Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
        Expanded(child:
        TextField(onChanged: (email) {


        },
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,textDirection:TextDirection.rtl,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'mohab',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 5.0),
          ),
        )),
      ],),
    ),
    SizedBox(height: 15,),
  ],);

}
