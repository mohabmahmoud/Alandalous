
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
Showmytoast(String msg,BuildContext context){

  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

}