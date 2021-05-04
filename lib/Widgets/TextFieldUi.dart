import 'package:flutter/services.dart';

import '../Constants/widthandheight.dart';
import 'package:flutter/material.dart';

class FormEditTextUi extends StatefulWidget {
  String title;
  TextEditingController Controller;
  bool password;
  var keyboardtype;
  FormEditTextUi(this.title,this.Controller,this.password,this.keyboardtype);

  @override
  _FormEditTextUiState createState() => _FormEditTextUiState();
}

class _FormEditTextUiState extends State<FormEditTextUi> {
  bool show=false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(width: getwidth(context) * .9 - 16, child:
      Text(
        widget.title ,
        textDirection:  TextDirection.rtl ,
        style: TextStyle(
            fontFamily: 'mohab', fontWeight: FontWeight.bold,fontSize: 14),
      )),
      Container(width: getwidth(context) * .9, child:
      Card(child:
      TextField(
          controller: widget.Controller,

          keyboardType: widget.keyboardtype,
          autocorrect: true,
          obscureText: show,
          inputFormatters:widget.password==null? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ]:null,


          decoration: InputDecoration(
              suffixIcon:
              widget.password==true?IconButton(icon:
              Icon((!show) ? Icons
                  .visibility : Icons.visibility_off,), onPressed: () {
                super.setState(() {
                  show = !show;
                });
              },):null,
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true)))),
      SizedBox(height: 10,),

    ],);
  }
}



