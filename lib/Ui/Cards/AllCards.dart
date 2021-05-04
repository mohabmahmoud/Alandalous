import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/Cards/CardModel.dart';
import 'package:alandalous/Ui/Cards/CardPage.dart';
import 'package:flutter/material.dart';
class AllCards extends StatefulWidget {
  @override
  _AllCardsState createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('مميزتنا'),),
    body: ListView.builder(itemCount: 3,scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),

      itemBuilder: (context, index) {
        return
          Hero(tag: All[index].name,child:InkWell(onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CardPage(All[index].name, widgets[index]);
          }));

        },child:Column(children: [
          Container(height: getheight(context)/5,child:widgets[index]),
          SizedBox(height: 10,)
        ],)));
      },

    ),

    );
  }
  List<Widget> widgets=[
    Container(
    alignment: Alignment.center
    ,
    child:Text('كارت الذهبى',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black.withOpacity(.4),fontSize: 20),),

    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/gold.jpg"),
        fit: BoxFit.cover,
      ),

      borderRadius: BorderRadius.all(Radius.circular(8)),),


  ),
    Container(
      alignment: Alignment.center
      ,
      child:Text('كارت الفضى',style: TextStyle(fontWeight: FontWeight.w900,color:Colors.black.withOpacity(.4),fontSize: 20),),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/silver.jpg"),
          fit: BoxFit.cover,
        ),

        borderRadius: BorderRadius.all(Radius.circular(8)),),


    ),
    Stack(children: [
      Container(
        alignment: Alignment.center
        ,
        child:Text('كارت الزنقة',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black.withOpacity(.4),fontSize: 20),),

        decoration: BoxDecoration(
          color: Colors.blue[900].withOpacity(.3),

          borderRadius: BorderRadius.all(Radius.circular(8)),),


      ),
      Positioned(top: 0,left: 0,child:
      Opacity(opacity: 1,child:
      Image.asset('images/f.png',height: 50)))

    ],)


  ];
  List<CardModle> All=[
    CardModle('كارت الذهبى',''),
    CardModle('كارت الفضى',''),
    CardModle('كارت الزنقة',''),


  ];



}
