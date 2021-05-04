import 'package:alandalous/Ui/ForgetPassword.dart';
import '../Constants/ClassNavigator.dart';
import 'package:flutter/material.dart';

class GotoForgetPassWord extends StatefulWidget {
  @override
  _GotoForgetPassWordState createState() => _GotoForgetPassWordState();
}

class _GotoForgetPassWordState extends State<GotoForgetPassWord> {
  @override
  Widget build(BuildContext context) {
    return Container(child: FlatButton(onPressed: () {
      Navigator.of(context).push(SecondPageRoute(ForgetPassword()));

    }, child:
    Text( 'نسيت كلمة المرور ؟' ,
      style: TextStyle(color: Theme
          .of(context)
          .primaryColor,fontSize: 13, fontWeight: FontWeight.bold),)));
  }
}
