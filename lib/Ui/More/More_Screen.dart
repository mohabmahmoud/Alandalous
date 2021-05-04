import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/AllStoresMap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';

import '../about.dart';


class More_Screen extends StatefulWidget {
  @override
  _More_ScreenState createState() => _More_ScreenState();
}

class _More_ScreenState extends State<More_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade200,appBar: AppBar(title: Text('المزيد'),),
    body: Directionality(textDirection: TextDirection.rtl,child:
    ListView(children: [

      Padding(padding: EdgeInsets.only(top:20,right: 10,left: 10,bottom: 5),child:
      Text('الحساب',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
      Container(color: Colors.white,child:Padding(padding: EdgeInsets.all(10),child:Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.person_outline,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('الاسم بالكامل',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('Mohab Mahmoud',style: TextStyle(color: Colors.grey),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],)


        ],),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.phone_outlined,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('رقم الهاتف',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('01270726043',style: TextStyle(color: Colors.grey),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],)


        ],),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.email_outlined,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('البريد الالكتروني',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
         Container(width: getwidth(context)/2,child: Row(children: [
            Expanded(child:Text('Mmahmoudmohab25@gmail.com',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey)),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],))


        ],),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.lock_open_sharp,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('كلمة المرور',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('تغير لمة المرور',style: TextStyle(color:Theme.of(context).primaryColor),),

          ],)


        ],),






      ],))),
      Padding(padding: EdgeInsets.only(top:20,right: 10,left: 10,bottom: 5),child:
      Text('اعدادت التطبيق',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
      Container(color: Colors.white,child:Padding(padding: EdgeInsets.all(10),child:Column(children: [

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.language,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('لغة التطبيق',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('اللغة العربية',style: TextStyle(color: Colors.grey),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],)


        ],),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.location_searching,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('تشغيل بيانات المكان',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          CupertinoSwitch(
            activeColor: Theme.of(context).primaryColor,
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),


        ],),





      ],))),

      Padding(padding: EdgeInsets.only(top:20,right: 10,left: 10,bottom: 5),child:
      Text('الاندلس',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
      Container(color: Colors.white,child:Padding(padding: EdgeInsets.all(10),child:Column(children: [
InkWell(child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.info_outline_rounded,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('رؤية الشركة',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('عن الاندلس',style: TextStyle(color: Colors.grey),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],)


        ],),onTap: (){
  Navigator.push(context, SecondPageRoute(About()));

},),
        Divider(),
        InkWell(onTap: ()async{


          await LocationPermissions().shouldShowRequestPermissionRationale();

          await LocationPermissions().requestPermissions().then((val)async{
            print(val.index);
            print(val.hashCode);


            if(val.index==1){

              Showmytoast('تاكد من تشغيل loction',context);

            }
            else{
              print('mohab');
              Location location=new Location();
              await location.getLocation().then((value) {
                Navigator.push(context, SecondPageRoute(AllStores(value.latitude,value.longitude)));
              });



            }});


        },child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            Icon(Icons.location_on_outlined,color: Colors.grey,),
            SizedBox(width: 10,),
            Text('جميع فروعنا',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600),),
          ],),
          Row(children: [
            Text('عرض الكل',style: TextStyle(color: Colors.grey),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,)

          ],)

        ],)),





      ],))),




    ],)),
    );
  }


  bool _switchValue=true;
}
