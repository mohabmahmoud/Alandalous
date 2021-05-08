import 'dart:math';

import 'package:alandalous/Constants/color.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'MyTable.dart';
class AllWorks extends StatefulWidget {
  @override
  _AllWorksState createState() => _AllWorksState();
}
const SCALE_FRACTION = 0.7;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 200.0;

class _AllWorksState extends State<AllWorks> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade300,body:

        Stack(children: [
          Column(children: [
                   Container(height: getheight(context)/4,
                decoration: BoxDecoration(color: Theme.of(context).primaryColor,




                ),


            ),
    Container(height: getheight(context)/4,),





    Container
      (
                decoration: BoxDecoration(color: Theme.of(context).primaryColor,






                  ),

      child:Padding(child:

      MyTable()

          ,


        padding: EdgeInsets.only(top:70)

      )
                )

          ,





          ],),



    Container(padding: EdgeInsets.only(top:getheight(context)/4 ),
    child:Column(children: [
            ClipPath(
              clipper: ArcClipper(),child:
                Container(color: Theme.of(context).primaryColor,height: getheight(context)/8,),










            ),
           Transform.scale(
    scale: -1,child:
    ClipPath(
        clipper: ArcClipper()
        ,child:
      Container(color: Theme.of(context).primaryColor,height: getheight(context)/8,),










      )),





          ],)),


          Container(padding: EdgeInsets.only(top:getheight(context)/4 ),
            child:


            Container(
              height: getheight(context)/4,
              child:
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    setState(() {
                      page = pageController.page;
                    });
                  }
                },
                child: PageView.builder(
                  onPageChanged: (pos) {
                    setState(() {
                      currentPage = pos;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final scale =
                    max(SCALE_FRACTION, (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return circleOffer(
                        listOfCharacters[index]['image'], scale);
                  },
                ),
              ),
            ),


          ),






          Positioned( right: getwidth(context)/15,left: getwidth(context)/15,top: getheight(context)/16,child:Container(height: getheight(context)/4,child:
          Center(child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              CircularPercentIndicator(
                radius: getheight(context)/8,
                lineWidth: 15,
                percent: 0.5,
                center: Text('%50',style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),),
                animationDuration: 3000,
                progressColor: Colors.green,
              ),

              SizedBox(height: 5,),
              Text('نسبة السداد %50',style: TextStyle(fontSize: 12,color: Theme.of(context).accentColor,fontWeight: FontWeight.bold),)
            ],),
            Container(child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
                  ItemDesc('السلعة',' موبايل oppo 5a'),
                  ItemDesc('المدفوع','1000 جنية'),
                  ItemDesc('المتبقى','1000 جنية'),
                  SizedBox(height: 10,),
                  Text('')
    ],)




            )




          ],))))



        ],)





    );
  }


  
  




  Widget circleOffer(String image, double scale) {

    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.centerRight,
        height: getwidth(context)/3 * scale,
        width: getwidth(context)/3* scale,
        child:
        Stack(children: [
          Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(side: BorderSide(color: Colors.grey.shade200, width: 5)),
            child: Image.asset(
              "images/money_bag.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(child:Text('b565',style: TextStyle(color: HexColor("57452f"),fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),))

        ],)

      ),
    );
  }


  double viewPortFraction = 0.5;

  PageController pageController;

  int currentPage = 3;

  List<Map<String, String>> listOfCharacters = [
    {'image': "images/money_bag.png", 'name': "Richmond"},
    {'image': "images/money_bag.png", 'name': "Richmond"},
    {'image': "images/money_bag.png", 'name': "Richmond"},
    {'image': "images/money_bag.png", 'name': "Richmond"},

  ];

  double page = 2.0;

  @override
  void initState() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  Row ItemDesc(String name,String value){
    return

      Row(children: [

        Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text(' : ${value}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

      ],);
  }

}


