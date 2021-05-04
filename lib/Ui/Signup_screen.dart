import 'dart:convert';
import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/isemail.dart';
import 'package:alandalous/Constants/isphone.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'HomeScreen/Home.dart';

class Signup extends StatefulWidget {
  bool lang;
  Signup(this.lang);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController namecont=TextEditingController();
  TextEditingController emailcont=TextEditingController();
  TextEditingController passcont=TextEditingController();
  TextEditingController phonecont=TextEditingController();
  TextEditingController passcontconf=TextEditingController();
  int id;
  String gname;
  bool load=false;
  bool fun=false;
  bool show=false;
  bool isok=true;
@override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
  int Selectedgender=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.grey[100],bottomNavigationBar:
    Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10,left: 15,right:15),
        width: getwidth(context),
        child: RaisedButton(
          elevation: 5.0,
          onPressed:()async{
            setState(() {
              load=true;
            });
    if(namecont.text.length<5){
      setState(() {
        errors['name']=['name should be bigger than 5 chars'];
        load=false;
        isok=false;


      });

    }
            if(!isemail(emailcont.text)){
              setState(() {
                errors['email']=['you should enter correct email'];
                load=false;
                isok=false;

              });

            }


            if(!isphone(phonecont.text)){
              setState(() {
                errors['phone']=['you should enter correct phone'];
                load=false;
                isok=false;

              });

            }



            if(passcont.text.length<6){
              setState(() {
                errors['password']=['password should be bigger than 6 chars'];
                load=false;
                isok=false;


              });

            }
            if(passcont.text!=passcontconf.text){
              setState(() {
                errors['password_confirmation']=['password confirmation should be equal password'];
                load=false;
                isok=false;


              });

            }





if(isok){

  Navigator.pushReplacement(context, SecondPageRoute(HomePage(true)));


}







          },
          color: Theme.of(context).primaryColor,
          child:
          (load)?AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader4,
            color: Theme.of(context).accentColor,
          ): Text(
            (widget.lang)?'تسجيل جديد':'SignUp',
            style: TextStyle(
              color:Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold ,
              fontFamily: 'mohab',

            ),
          ),
        )),appBar: AppBar(title: Text((widget.lang)?'تسجيل جديد':'SignUp',style: TextStyle(fontWeight: FontWeight.bold),),),body:
    Container(padding: EdgeInsets.all(15),child:
   SingleChildScrollView(child:
   Column(mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
       SizedBox(height: 30,),

       Card(child:Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(

            border: Border.all(color:(errors['name']!=null)?Colors.red:Theme.of(context).primaryColor,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: 60.0,
        child: TextField(controller: namecont,

          onChanged: (val){
            setState(() {
              errors['name']=null;
            });
          },
          textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,
          keyboardType:TextInputType.text,
          style: TextStyle(
            fontFamily: 'mohab',
            fontWeight: FontWeight.bold
          ),
          textAlign: (widget.lang)?TextAlign.right:TextAlign.start,
          decoration: InputDecoration(
            border: InputBorder.none,


            suffixIcon: (widget.lang)?Icon(
              Icons.person_outline,
              color: Theme.of(context).primaryColor,
            ):null,prefixIcon: (!widget.lang)?Icon(
            Icons.person_outline,
            color: Theme.of(context).primaryColor,
          ):null,
            hintText: (widget.lang)?'الاسم':'Full Name',
            hintStyle:TextStyle(fontFamily: 'mohab',fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold),
          ),
        ),
      )),
       (errors['name']==null)?SizedBox(height: 10,): Container(alignment: Alignment.topLeft,width: getwidth(context)-30,height: 25,child:
      Text(errors['name'].join(' '),
        textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 12),)



      ),
     Card(child:Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(

            border: Border.all(color:(errors['email']==null)?Theme.of(context).primaryColor:Colors.red,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: 60.0,
        child: TextField(controller: emailcont,
          onChanged: (val){
          setState(() {
            errors['email']=null;
          });

          },
          textDirection:(widget.lang)?TextDirection.rtl:TextDirection.ltr ,
          keyboardType:TextInputType.emailAddress,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
          textAlign:(widget.lang)? TextAlign.right:TextAlign.left,
          decoration: InputDecoration(

            border: InputBorder.none,

            suffixIcon: (widget.lang)?Icon(
              Icons.mail_outline,
              color: Theme.of(context).primaryColor,
            ):null,
            prefixIcon:  (!widget.lang)?Icon(
              Icons.mail_outline,
              color: Theme.of(context).primaryColor,
            ):null,
            hintText:(widget.lang)?'البريد الالكتروني':'E-mail',
            hintStyle:TextStyle(fontFamily: 'mohab',fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold),
          ),
        ),
      )),
       (errors['email']==null)?SizedBox(height: 10,): Container(alignment: Alignment.topLeft,width: getwidth(context)-30,height: 25,child:
       Text(errors['email'].join(' '),
         textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 12),)



       ),
        Card(child:Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(

            border: Border.all(color:Theme.of(context).primaryColor,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: 60.0,
        child: TextField(controller: phonecont,
          onTap: (){
          setState(() {
            show=true;
          });
          },
          onChanged: (val){
            setState(() {
              errors['phone']=null;
            });
          },
          keyboardType:TextInputType.phone,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
          textAlign: (widget.lang)?TextAlign.end:TextAlign.start,
          decoration: InputDecoration(
            border: InputBorder.none,

            prefixText:(!show)?'': ' +20 ',
            prefixIcon: (!widget.lang)?Icon(
              Icons.phone_enabled_outlined,
              color: Theme.of(context).primaryColor,
            ):null,
            suffixIcon: (widget.lang)?Icon(
              Icons.phone_enabled_outlined,
              color: Theme.of(context).primaryColor,
            ):null,
            hintText: (widget.lang)?'رقم الجوال':'Mobile Number',
            hintStyle:TextStyle(fontFamily: 'mohab',fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold),

          ),
        ),
      )),

       (errors['phone']==null)?SizedBox(height: 10,): Container(alignment: Alignment.topLeft,width: getwidth(context)-30,height: 25,child:
       Text(errors['phone'].join(' '),
         textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 12),)



       ),
     Card(child:Container(
       alignment: Alignment.centerLeft,

       decoration: BoxDecoration(

           border: Border.all(color:Theme.of(context).primaryColor,width: 2),
           borderRadius: BorderRadius.all(Radius.circular(5))
       ),
       height: 60.0,
       child: TextField(controller: passcont,
         onChanged: (val){
           setState(() {
             errors['password']=null;
           });
         },
         keyboardType:TextInputType.visiblePassword,
         textDirection: (widget.lang)? TextDirection.rtl:TextDirection.ltr,
         obscureText: true,
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontFamily: 'mohab',
         ),
         textAlign: (widget.lang)?TextAlign.right:TextAlign.left,
         decoration: InputDecoration(

           border: InputBorder.none,

           suffixIcon:(widget.lang)?Icon(
             Icons.lock_outline,
             color: Theme.of(context).primaryColor,
           ):null,
           prefixIcon:(!widget.lang)?Icon(
             Icons.lock_outline,
             color: Theme.of(context).primaryColor,
           ):null,


           hintText: (widget.lang)?'كلمة المرور':'Password',
           hintStyle:TextStyle(fontFamily: 'mohab',fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold),
         ),
       ),
     )),
       (errors['password']==null)?SizedBox(height: 10,): Container(alignment: Alignment.topLeft,width: getwidth(context)-30,child:
       Text(errors['password'].join('\n'),
         textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 12),)



       ),
        Card(child:Container(
        alignment: Alignment.centerLeft,

        decoration: BoxDecoration(

            border: Border.all(color:Theme.of(context).primaryColor,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: 60.0,
        child: TextField(controller: passcontconf,
          onChanged: (val){
            setState(() {
              errors['password_confirmation']=null;
            });
          },
          keyboardType:TextInputType.visiblePassword,
          textDirection: (widget.lang)? TextDirection.rtl:TextDirection.ltr,
          obscureText: true,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
          textAlign: (widget.lang)?TextAlign.right:TextAlign.left,
          decoration: InputDecoration(

            border: InputBorder.none,

            suffixIcon:(widget.lang)?Icon(
              Icons.lock_outline,
              color: Theme.of(context).primaryColor,
            ):null,
            prefixIcon:(!widget.lang)?Icon(
              Icons.lock_outline,
              color: Theme.of(context).primaryColor,
            ):null,


            hintText: (widget.lang)?'تاكيد كلمة المرور':'Password Confirm',
            hintStyle:TextStyle(fontFamily: 'mohab',fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold),
          ),
        ),
      )),
       (errors['password_confirmation']==null)?SizedBox(height: 10,): Container(alignment: Alignment.topLeft,width: getwidth(context)-30,height: 25,child:
       Text(errors['password_confirmation'].join(' '),
         textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 12),)



       ),
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
       Card(color:(Selectedgender==1)?Theme.of(context).primaryColor: Colors.white,child:Container(
         alignment: Alignment.centerLeft,

         decoration: BoxDecoration(

             border: Border.all(color:Theme.of(context).primaryColor,width: 2),
             borderRadius: BorderRadius.all(Radius.circular(5))
         ),
         height: 50.0,
         width: getwidth(context)/3-30,
         child:
         InkWell(onTap: (){
           setState(() {
             Selectedgender=1;
           });

         },child:
         Row(mainAxisAlignment: MainAxisAlignment.center,children: [
           Text((widget.lang)?'ذكر':'Mail',style: TextStyle(fontWeight: FontWeight.bold,color:(Selectedgender==2)?Theme.of(context).primaryColor: Colors.white,fontSize: 13),),
           SizedBox(width: 10,),
           Image.asset('images/mail.png',height: 16,color: (Selectedgender==2)?Theme.of(context).primaryColor: Colors.white,)
         ],)),
       )),
       Card(color:(Selectedgender==2)?Theme.of(context).primaryColor: Colors.white,child:Container(
         alignment: Alignment.centerLeft,

         decoration: BoxDecoration(

             border: Border.all(color:Theme.of(context).primaryColor,width: 2),
             borderRadius: BorderRadius.all(Radius.circular(5))
         ),
         height: 50.0,
         width: getwidth(context)/3-30,
         child:InkWell(onTap: (){
           setState(() {
             Selectedgender=2;
           });

         },child:
         Row(mainAxisAlignment: MainAxisAlignment.center,children: [
           Text((widget.lang)?'انثى':'Femail',style: TextStyle(fontWeight: FontWeight.bold,color:(Selectedgender==1)?Theme.of(context).primaryColor: Colors.white,fontSize: 13),),
           SizedBox(width: 10,),
           Image.asset('images/femail.png',height: 16,color:(Selectedgender==1)?Theme.of(context).primaryColor: Colors.white,)
         ],)),
       )),
       Card(child:Container(
         alignment: Alignment.centerLeft,

         decoration: BoxDecoration(

             border: Border.all(color:Theme.of(context).primaryColor,width: 2),
             borderRadius: BorderRadius.all(Radius.circular(5))
         ),
         height: 50.0,
         child:Directionality(
             textDirection: (widget.lang)
                 ? TextDirection.rtl
                 : TextDirection.ltr,
             child:

             DropdownButtonHideUnderline(child:
             DropdownButton<String>(
               hint:
               Text((widget.lang)
                   ? "سنة الميلاد "
                   : ' Year ',
                 textAlign: TextAlign.center,

                 textDirection: TextDirection.ltr,
                 style: TextStyle(fontSize: 14,fontFamily: 'mohab',
                     color: Colors.grey,fontWeight: FontWeight.bold),),
               value: selectedyear ,
               onChanged: (String  Value) {
                 setState(() {
                   selectedyear = Value;
                 });
               },
               items: GetYears().map((re) {
                 return DropdownMenuItem<String>(
                   value: re,
                   child:
                   Text(   '  '+re+'  '
                     ,textAlign: TextAlign.center,
                     style: TextStyle(fontFamily: 'mohab',
                         fontWeight: FontWeight.bold,
                         color: Colors.black),
                   ),
                 );
               }).toList(),
             ),)


         ),
       )),


     ],), FlatButton(onPressed: ()async{

         // _resolveNumber();

        // print('getPhoneNumber result: $phoneNumber');

       },child: Text(''),)









    ],))



      ,),




    );
  }
  void dispose() {


    super.dispose();
  }
  SharedPreferences prefs ;




  Signupuser() async {






  }




  String selectedyear;
  List<String> GetYears(){
    List<String> z=[];
    int x=1920;
    for (x;x<DateTime.now().year-15;x++){

      z.add(x.toString());
    }
    return  z;

  }
  Map errors={
    'name':null,
    'email':null,
    'phone':null,
    'password_confirmation':null,
    'password':null,

  };





}



