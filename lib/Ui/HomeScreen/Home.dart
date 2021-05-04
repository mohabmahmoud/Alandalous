import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/Colors.dart';
import 'package:alandalous/Constants/color.dart';
import 'package:alandalous/Constants/showtoast.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/AllProducts.dart';
import 'package:alandalous/Ui/Money/MyPoints.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';
import '../../NewOrder.dart';
import '../AddOrder/AllCat_Orders.dart';
import '../AllStoresMap.dart';
import '../AllWorks.dart';
import '../MyCart.dart';
import '../about.dart';
import 'OffersSlider.dart';
class HomePage extends StatefulWidget {
  bool lang;
  HomePage(this.lang);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController ;


  @override
  void initState() {
    scrollController = ScrollController();

  }


  List category=[
    'https://images.indianexpress.com/2019/07/smart-phones-amp.jpg',
    'https://cdn.mos.cms.futurecdn.net/eXUqh8hpWDqBbwFP9icv3i.jpg',
    'https://storage.googleapis.com/cbc-sofra-assets/uploads/editor_files/258f4c48d5e2eeac40c3a78195173b1d.jpg'

  ];

  @override
  Widget build(BuildContext context) {
    return

        Scaffold(appBar:
    AppBar(

    actions: [IconButton(onPressed: (){
      Navigator.push(context, SecondPageRoute(Mycart(widget.lang)));



    },icon:Icon(Icons.shopping_cart_outlined))]
    ,title:

    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Text('AL-Andalous',style: TextStyle(fontSize: 16),),
      SizedBox(width: 5,),
      Image.asset('images/logo.png',height: 25,color: Theme.of(context).accentColor,),


    ],) ,


        bottom: PreferredSize(
          child: InkWell(child:
          Container(
            color: Theme.of(context).primaryColor,
            height:getheight(context)/15,
            alignment: Alignment.center,
            child:
            Container(width: getwidth(context)*.98,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 3,right: 3),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0,1),
                  ),
                ],
              ),
              height: getheight(context)/17,
             child:Padding(padding: EdgeInsets.only(left: 7,right: 7),child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
               Container()
,
               Text('عن ماذا تبحث ؟',style: TextStyle(fontSize: 15,color: ShadowColor,fontWeight: FontWeight.bold),),



               Icon(Icons.search_rounded,color: ShadowColor,),

             ],))
            ),

          ),onTap: (){


          },),
          preferredSize: Size.fromHeight(getheight(context)/15))

    ),body:
      Directionality(textDirection: TextDirection.rtl,child:NotificationListener(child:ListView(shrinkWrap: true,children: [

        Home_Offer_Slider(context),
        SizedBox(height: 5,),
        Container(height: getheight(context)/9,child:

        ListView(scrollDirection: Axis.horizontal,
          children: [
            Padding(padding: EdgeInsets.only(left:4,right:4),child:
            Container(
              alignment: Alignment.center
              ,height: getheight(context)/9,
              width: getwidth(context)/3,
              child:Text('كارت الذهبى',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black.withOpacity(.4),fontSize: 16),),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/gold.jpg"),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.all(Radius.circular(8)),),


            ),



            ),
            Padding(padding: EdgeInsets.only(left:4,right:4),child: Container(
              alignment: Alignment.center
              ,height: getheight(context)/7,
              width: getwidth(context)/3,
              child:Text('كارت الفضى',style: TextStyle(fontWeight: FontWeight.w900,color:Colors.black.withOpacity(.4),fontSize: 16),),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/silver.jpg"),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.all(Radius.circular(8)),),


            )),
            Padding(padding: EdgeInsets.only(left:4,right:4),child:
            Stack(children: [
              Container(
                alignment: Alignment.center
                ,height: getheight(context)/7,
                width: getwidth(context)/3,
                child:Text('كارت الزنقة',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black.withOpacity(.4),fontSize: 16),),

                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.3),

                  borderRadius: BorderRadius.all(Radius.circular(8)),),


              ),
              Positioned(top: 0,left: 0,child:
              Opacity(opacity: 1,child:
              Image.asset('images/f.png',height: getheight(context)/13,)))

            ],)



            ),

          ],
        ),),



        Padding(padding: EdgeInsets.all(5),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Padding(padding: EdgeInsets.only(left: 5,right: 5),child:Text('جميع الاقسام',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold,),))



        ],)),






        Container(width: getwidth(context),height: getheight(context)/4,child:
            SingleChildScrollView(scrollDirection: Axis.horizontal,child:
                Row(children: [
                  Card(child:Column(children: [
                    Container(height:30 ,child:Text('موبيلات',style: TextStyle(fontWeight: FontWeight.bold),)),

                    Expanded(child:FancyShimmerImage(imageUrl: category[0],width: getheight(context)/4,))

                  ],)
              ),
                  GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      scrollDirection: Axis.horizontal,
                      children:category.map <Widget>((e) {
                        return Card(child:
                            Column(children: [
                              Container(alignment: Alignment.topCenter,width: getheight(context)/8,height: 25,child:Text('موبيل',style: TextStyle(fontWeight: FontWeight.bold),)),
                              Expanded(child: FancyShimmerImage(imageUrl: e,))

                            ],)


                        );

                      }).toList()
                  )

                ],)
            )



        ),






       Container(height: getheight(context)/2,child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children:[1,2,3,4,5,6,76,7,8,5,9,0,].map<Widget>((value) {
            return
              InkWell(onTap: ()async{


              },child:Card(child:

              Container(width: getwidth(context)/2,color: Theme.of(context).accentColor,child: Column(children: [
                Stack(children: [
                  Container(child:
                  FancyShimmerImage(imageUrl:'https://cf1.s3.souqcdn.com/item/2020/10/07/13/18/84/11/1/item_L_131884111_b431d6d760a70.jpg'),height:getheight(context)/3-90-8 ,width: getwidth(context)/2,),


                  Positioned(left: 0,top: 5,child:Container(decoration:
                  BoxDecoration(
                    color: Colors.redAccent.shade400,
                    borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(17.0),
                      topRight: const Radius.circular(17.0),
                    ),
                  ),
                    height:30,child: Center(child: Text('  خصم  '+'جنية   ',style: TextStyle(fontSize: 12,fontFamily: 'mohab',color: Colors.white),),),)),





                ],),

                Container(width: getwidth(context)/2,padding: EdgeInsets.only(right:10,left: 10),child:




                Text('')




                ),
                Expanded(child:Text('OPPO Reno4 Dual SIM Mobile - 6.4 Inch, 12',maxLines: 2,textAlign: TextAlign.center ,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'mohab'),)),


                Opacity(child:Container(color: Theme.of(context).primaryColor,width: getwidth(context)/2,height: 1,),opacity: .5,),
                Container(alignment: Alignment.topCenter,height: 20,padding: EdgeInsets.only(right:10,left: 10),child:
                Row(textDirection: (!widget.lang)?TextDirection.rtl:TextDirection.ltr,mainAxisAlignment: MainAxisAlignment.center,children: [
                  SizedBox(width: 5,),
                  Text((widget.lang)?'2270 جنية ':'LE',textDirection:  (widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontSize: 12,fontFamily: 'mohab',fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor ),),




                ],),


                ),

               RaisedButton(

                   child:
                       Wrap(children: [
                         Image.asset('images/Bottom/more.png',height: 30,),
                         Text('طلب بتقسيط',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                       ],),
                   color:Colors.redAccent.shade400,onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return NewOrder();
                     }));

                })





              ],),),


              ));
          }).toList(),
        )),





      ],controller:scrollController ,),onNotification: (t) {
      if (t is ScrollEndNotification) {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){

      setState(() {



      });

      }
      }
      })

      ,));
  }
}
