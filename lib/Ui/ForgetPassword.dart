import 'package:flutter/material.dart';
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('نسيت كلمة المرور ؟'),
    centerTitle: true,),body:
        Container(padding: EdgeInsets.all(10),child:
    Column(children: [
      Container(child:Text('هل نسيت كلمة المرور؟ لا توجد مشكلة  علي الأطلاق من فضلك ادخل اسم المستخدم الخاص بك او بريدك الالكتروني ثم اضغط اعادة تعيين كلمة السر وسوف تتلقي رسالة علي بريدك الاكتروني تحتوي علي اسم المستخدم الخاص بك وكذلك رابط يسمح لك بتغيير كلمة السر'
        )),
      SizedBox(height: 20,),
      Container(child: Container(

        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(

            border: Border.all(color:Theme.of(context).primaryColor,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: 60.0,
        child: TextField(controller: email_controller,
          keyboardType:TextInputType.emailAddress,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'mohab',
          ),
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            border: InputBorder.none,


            suffixIcon:  Icon(
              Icons.mail_outline,
              color: Theme.of(context).primaryColor,
            ),
            hintText:'البريد الالكتروني',
            hintStyle:TextStyle(fontSize: 14,fontFamily: 'mohab',color: Colors.grey,fontWeight: FontWeight.bold),
          ),
        ),
      ),)
    ],)),bottomNavigationBar: Container(padding: EdgeInsets.all(10),height: 70,child:
    RaisedButton(color: Theme.of(context).primaryColor,onPressed:()async{


    },
    child:Text('ارسال للبريد الالكتروني',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),),);
  }
  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(msg,),
          actions: <Widget>[
            TextButton(
              child: Text('اغلاق',),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
