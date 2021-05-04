import 'package:alandalous/Constants/ClassNavigator.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/Search/search.dart';
import 'package:flutter/material.dart';

import 'AddOrder.dart';
import 'AllOrders.dart';
class AllCat_Orders extends StatefulWidget {
  bool lang;
  AllCat_Orders(this.lang);
  @override
  _AllCat_OrdersState createState() => _AllCat_OrdersState();
}

class _AllCat_OrdersState extends State<AllCat_Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(heroTag: 'mohab',child:
    Icon(Icons.add,color: Theme.of(context).accentColor,),onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return AddOrder(true);
      }));


    },backgroundColor: Theme.of(context).primaryColor,),appBar: AppBar(
      title: Text('الطلبات'),
      bottom: PreferredSize(
          child: InkWell(child:
          Container(
            color: Theme.of(context).primaryColor,
            height:getheight(context)/15,
            alignment: Alignment.center,
            child:
            Container(width: getwidth(context)*.98,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 7,right: 7),
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
              child:
              TextField(onChanged: (pass){



              },controller: null,
                textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color:Theme.of(context).primaryColor,
                  fontFamily: 'mohab',
                ),
                decoration: InputDecoration(
                  prefixIcon: (widget.lang)?IconButton(icon:Icon(Icons.search,color: Colors.grey,),onPressed: (){},):null,
                  suffixIcon:  (!widget.lang)?IconButton(icon:Icon(Icons.search,color: Theme.of(context).primaryColor,),onPressed: (){},):null,
                  border: InputBorder.none,
                  enabled: false,
                  contentPadding: EdgeInsets.all(3),
                  hintText: (widget.lang)?' قم بادخال اسم العميل للبحث عنه ؟':'What Do You Want ?',
                  hintStyle:TextStyle(fontWeight: FontWeight.w500,fontFamily: 'mohab',fontSize: 14,color:Colors.grey,
                  ),
                ),
              ),
            ),

          ),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return Search(true);
            }));

          },),
          preferredSize: Size.fromHeight(getheight(context)/15)),




    ),
    body: Padding(padding: EdgeInsets.all(10),child:ListView(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

        Item('قيد الارسال','send.png',context,123),
        Item('قيد الاستعلام','search.png',context,25),
        Item('تم قبولة','done.png',context,3),



      ],),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

        Item('قيد الارسال','send.png',context,123),
        Item('قيد الاستعلام','search.png',context,25),
        Item('تم قبولة','done.png',context,3),



      ],),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

        Item('قيد الارسال','send.png',context,123),
        Item('قيد الاستعلام','search.png',context,25),
        Item('تم قبولة','done.png',context,3),



      ],),

      Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

        Item('تم رفضة','close.png',context,1000),
        Item('تم رفضة','close.png',context,1000),
        Item('تم رفضة','close.png',context,1000),



      ],),


    ],),

    ));
  }

  Item(String name,String img,BuildContext context,int num){

    return InkWell(onTap: (){

      Navigator.push(context, SecondPageRoute(AllOrders(name)));

    },child:Container(width: getwidth(context)/4,height: getwidth(context)/4+30,

        child:
        Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
           Container(

               height: getwidth(context)/4,width:
           getwidth(context)/4,child:Card(child:
           Padding(padding: EdgeInsets.all(5),child:
           Image.asset('images/'+img,)
           )
           )
           ),
            Container(alignment: Alignment.center,child:Text(name,style: TextStyle(fontWeight: FontWeight.bold),)),
          ],),



          Positioned(top: 0,right: 0,child:Container(decoration: BoxDecoration(
              color: Colors.red
          ,borderRadius:

          
          BorderRadius.all(Radius.circular(30))
          ),child: Padding(padding: EdgeInsets.only(right: 6,left: 6),child:Text(num.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor ),)),))
        ],)
    ));

  }


}
