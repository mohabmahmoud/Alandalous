import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('عن الأندلس'),),
    body:
    Directionality(textDirection: TextDirection.rtl,child:Container(padding: EdgeInsets.only(top:getheight(context)/10),child:
    Column(children: [
      ListTile(title:
      Text('شركة الاندلس للتقسيط' ,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),subtitle:Text('الاندلس للتقسيط معانا تقدر تقسط موبايل- بلاي ستيشن وكل ما تحتاجه من اشياء شركة الاندلس للتقسيط شركة بتجيب للعميل اللي هو عايزه من اي حته لو كانت مستعملة وتقسطهاله حسب اختيار العميل حالة المنتج الاوارق المطلوبة صورة بطاقة وصورة بطاقة ضامن وايصال مرافق بيكون عندنا 8 انظمة للسداد بتبدا من ٣ شهور الي ٢٤ شهر يحق للعميل وحده اختيار نظام السداد المناسب ليه واخر حاجة في مفاجاءة للعميل عند الجدية في الشراء',textAlign: TextAlign.center,),),

      SizedBox(height: 50,),Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        InkWell(onTap: ()async{

          _launchURL();

        },child:Padding(padding: EdgeInsets.all(5),child:Image.asset('images/facebook.png',height: getheight(context)/13,


        ))),
        SizedBox(width: 10,),
        InkWell(onTap: (){

          FlutterOpenWhatsapp.sendSingleMessage("+201014172368", " ");
        },child:
        Padding(padding: EdgeInsets.all(5),child:Image.asset('images/whats.png',height: getheight(context)/13,))),

      ],)


    ],)

        )));
  }
  _launchURL() async {
    const url = 'https://www.facebook.com/AlAndalous.co';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
