import 'package:alandalous/Constants/widthandheight.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class AllCategrios extends StatefulWidget {
     bool lang;
     AllCategrios(this.lang);


  @override
  _AllCategriosState createState() => _AllCategriosState();
}

class _AllCategriosState extends State<AllCategrios> {
  List<category> categrios=[
    category(1, 'موبايلات', 'https://www.arabtimenews.com/wp-content/uploads/2021/03/%D8%A7%D8%AE%D8%AA%D8%A7%D8%B1-%D9%85%D8%B9%D9%86%D8%A7-%D8%A7%D9%81%D8%B6%D9%84-%D9%87%D8%A7%D8%AA%D9%81-%D8%B1%D8%A7%D8%A6%D8%AF-%D9%81%D9%8A-2019.jpg'),
    category(1, 'موبايلات', 'https://www.arabtimenews.com/wp-content/uploads/2021/03/%D8%A7%D8%AE%D8%AA%D8%A7%D8%B1-%D9%85%D8%B9%D9%86%D8%A7-%D8%A7%D9%81%D8%B6%D9%84-%D9%87%D8%A7%D8%AA%D9%81-%D8%B1%D8%A7%D8%A6%D8%AF-%D9%81%D9%8A-2019.jpg'),
    category(1, 'موبايلات', 'https://www.arabtimenews.com/wp-content/uploads/2021/03/%D8%A7%D8%AE%D8%AA%D8%A7%D8%B1-%D9%85%D8%B9%D9%86%D8%A7-%D8%A7%D9%81%D8%B6%D9%84-%D9%87%D8%A7%D8%AA%D9%81-%D8%B1%D8%A7%D8%A6%D8%AF-%D9%81%D9%8A-2019.jpg'),
    category(1, ' اجهزة كهربائية', 'https://tijaratuna.com/wp-content/uploads/2020/11/BeVusZGIEAEocbd-571x300.png'),
    category(1, ' اجهزة كهربائية', 'https://tijaratuna.com/wp-content/uploads/2020/11/BeVusZGIEAEocbd-571x300.png'),
    category(1, ' اجهزة كهربائية', 'https://tijaratuna.com/wp-content/uploads/2020/11/BeVusZGIEAEocbd-571x300.png'),
    category(1, ' اجهزة كهربائية', 'https://tijaratuna.com/wp-content/uploads/2020/11/BeVusZGIEAEocbd-571x300.png'),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade200,appBar: AppBar(title: Text('الاقسام'),),
    body: Padding(child:
    GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: ((getwidth(context)/3) / getheight(context)*5),
        children:categrios.map<Widget>((e) {
          return Card(child:Column(
            children: [
              Container(alignment: Alignment.center,height: getheight(context)/20,child:Text(e.name)),

              Expanded(child:FancyShimmerImage(imageUrl: e.image,height: getwidth(context)/3,)),
            ],
          ));

        }).toList()
    ),

    padding: EdgeInsets.only(top:10),),);
  }
}
