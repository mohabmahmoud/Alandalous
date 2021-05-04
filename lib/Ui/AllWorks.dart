import 'dart:math';

import 'package:alandalous/Constants/color.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
        ClipPath(
            clipper: ArcClipper(),
            child:            Container(height: getheight(context)/2.5,
                decoration: BoxDecoration(color: Theme.of(context).primaryColor,


                )

            )),








    Expanded(
    child:
    ClipPath(
        clipper: OvalTopBorderClipper(),
    child:
    Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor,






                  ),

      child:Padding(child:
      GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: ((getwidth(context)/3) / getheight(context)*13),
          children:[1,2,3,4,5,6,7,8,10,11,12].map<Widget>((e) {
            return 
              Padding(padding: EdgeInsets.all(3),child:Container(decoration:BoxDecoration(
                
              borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Theme.of(context).accentColor
              
              ),alignment: Alignment.center,child:
                  Text('شهر ${e.toString()}',style:TextStyle(fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor,))
              ));

          }).toList()
      ),

        padding: EdgeInsets.only(top:50,)

      )
                ))

            ),





          ],),

 Container(padding: EdgeInsets.only(top:getheight(context)/7 ),
            child:


            Container(
              height: getheight(context)/3,
              child: NotificationListener<ScrollNotification>(
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
        ],)





    );
  }

  Widget code(){
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text('#B234',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

        Icon(Icons.person_outline),

      ],),
      Text('المدفوع 1000 جنية',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
      Text('المتبقي 1000 جنية',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
    ],);


  }
  Widget Selectedcode(){
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text('#B234',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

        Icon(Icons.person_outline),

      ],),
      Text('المدفوع 1000 جنية',textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
      Text('المتبقي 1000 جنية',textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
      Text('الشهور المتبقية 3 شهور',textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
    ],);


  }
  
  




  Widget circleOffer(String image, double scale) {

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: getwidth(context)/2.5 * scale,
        width: getwidth(context)/2.5 * scale,
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

  int currentPage = 2;

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

}


