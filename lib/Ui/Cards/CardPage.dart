import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  String title;
  Widget card;
  CardPage(this.title,this.card);
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(tag:widget.title,child:Scaffold(appBar: AppBar(title:Text(widget.title) ,),

    body:ListView(children: [
      Container(height: getheight(context)/4,child:
      widget.card,),
      Text('تفاصيل الكارت')

    ],) ,
    ));
  }
}
