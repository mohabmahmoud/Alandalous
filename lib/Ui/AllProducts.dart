import 'dart:async';

import 'package:alandalous/Constants/widthandheight.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_skeleton/loading_skeleton.dart';
import 'package:http/http.dart' as http;
import 'package:skeleton_text/skeleton_text.dart';
class AllProducts extends StatefulWidget {
  String cat_name;
  bool lang;

  AllProducts(this.cat_name,this.lang);
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  ScrollController scrollController ;


  @override
  void initState() {
    scrollController = ScrollController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.cat_name),),body:
        FutureBuilder(future: getdata(),builder: (context, snapshot) {
         return (snapshot.hasData)?
               NotificationListener(child:
              SingleChildScrollView(controller:scrollController ,child
                  :
              GridView.count(physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: ((getwidth(context)/2) / getheight(context)*2),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children:[1,2,3,4,5,6,76,7,8,5,9,0,].map<Widget>((value) {
                  return
                    InkWell(onTap: ()async{


                    },child:Card(child:

                    Container(color: Theme.of(context).accentColor,child: Column(children: [
                      Stack(children: [
                        Container(child:
                        FancyShimmerImage(imageUrl:'https://cf1.s3.souqcdn.com/item/2020/10/07/13/18/84/11/1/item_L_131884111_b431d6d760a70.jpg'),height:getheight(context)/4 ,width: getwidth(context)/2,),


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
                      Expanded(child:Text('OPPO Reno4 Dual SIM Mobile - 6.4 Inch, 12',maxLines: 2,textAlign: TextAlign.center ,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: 'mohab'),)),


                      Opacity(child:Container(color: Theme.of(context).primaryColor,width: getwidth(context)/2,height: 1,),opacity: .5,),
                      Container(alignment: Alignment.topCenter,height: 20,padding: EdgeInsets.only(right:10,left: 10),child:
                      Row(textDirection: (!widget.lang)?TextDirection.rtl:TextDirection.ltr,mainAxisAlignment: MainAxisAlignment.center,children: [
                        SizedBox(width: 5,),
                        Text((widget.lang)?'2270 جنية ':'LE',textDirection:  (widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontSize: 12,fontFamily: 'mohab',fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor ),),




                      ],),


                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Container(width: getwidth(context)/3,height: 40,alignment: Alignment.centerLeft,child:RaisedButton(color: Theme.of(context).primaryColor,onPressed: ()async{

/*
                    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();


                    Navigator.push(context, MaterialPageRoute(builder: (_){

                      return   Product(value.documentID, sharedPreferences.getString('id'),widget.lang,'');
                    }));

*/


                        },child:
                        Row(textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,mainAxisAlignment:
                        MainAxisAlignment.center,children: [   Icon(Icons.add_shopping_cart,size: 15,color: Colors.white), Text((widget.lang)?'اضافة للسلة':'To Cart',style: TextStyle(fontSize: 11,color: Colors.white,fontFamily: 'mohab'),),
                        ],)

                        ),

                        ),

                        IconButton(icon:Icon(Icons.favorite_border),onPressed: (){

                        },)

                        ,
                      ],)





                    ],),),


                    ));
                }).toList(),
              ),
              ),



                  onNotification: (t) {
                    if (t is ScrollEndNotification) {
                      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){

                        setState(() {



                        });

                      }
                    }
                  }):
         GridView.count(physics: NeverScrollableScrollPhysics(),
           crossAxisCount: 2,
           childAspectRatio: ((getwidth(context)/2) / getheight(context)*2),
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           children:[1,2,3,4].map<Widget>((value) {
             return
               Card(elevation: 0.3,child:

               Container(color: Theme.of(context).accentColor,child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,children: [

                 LoadingSkeleton(
                   colors:  [Theme.of(context).primaryColor.withOpacity(.3),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2,
                   height: getheight(context)/4,
                 ),

                 SizedBox(height: 10,),
                 LoadingSkeleton(
                   colors: [Theme.of(context).primaryColor.withOpacity(.3),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2-30,
                   height: 20,
                 ),
                 SizedBox(height: 10,),
                 LoadingSkeleton(
                   colors:  [Theme.of(context).primaryColor.withOpacity(.3),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2-40,
                   height: 20,
                 ),
                 SizedBox(height: 10,),
                 LoadingSkeleton(
                   colors:  [Theme.of(context).primaryColor.withOpacity(.4),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2-40,
                   height: 20,
                 ),
                 SizedBox(height: 10,),
                 LoadingSkeleton(
                   colors:  [Theme.of(context).primaryColor.withOpacity(.4),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2-40,
                   height: 20,
                 ),
                 SizedBox(height: 10,),
                 Expanded(child:LoadingSkeleton(
                   colors:  [Theme.of(context).primaryColor.withOpacity(.4),Colors.grey.shade400,Colors.grey.shade300,Colors.grey.shade200],
                   width: getwidth(context)/2-40,
                   height: 1,
                 ) ,)

                 























               ],),),


               );
           }).toList(),
         );

        },)






    );
  }

  getdata()async{
    List x=['',''];



   var v=await http.get('https://httpbin.org/get');
   return x;

  }

}
