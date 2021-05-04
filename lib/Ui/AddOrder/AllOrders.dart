import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/AddOrder/AddOrder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AllOrders extends StatefulWidget {
  String name;
  AllOrders(this.name);
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
      title: Text(widget.name),
    ),body: Directionality(child:FutureBuilder(future: getdata(),builder: (context, snapshot) {
      return !snapshot.hasData?ListView.builder(itemCount: 5,itemBuilder: (context, index) {
        return
        Item('name')
          ;
      },):CircularProgressIndicator();
    },),textDirection: TextDirection.rtl,));
  }

  Item(String name){
    return Card(elevation: .3,margin: EdgeInsets.all(7),child:
    Padding(padding: EdgeInsets.all(10),child:Column(children: [
      Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

        Text('مهاب محمود سعيد',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
        Container(decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
            ,borderRadius:


        BorderRadius.all(Radius.circular(30))
        ),child: Padding(padding: EdgeInsets.only(right: 6,left: 6),child:Text('#B47',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor ),)),),


      ],) ),
      SizedBox(height: 3,),
      Container(child:Row(children: [
        Text('نوع الحهاز   :',style: TextStyle(color: Colors.grey),),

        SizedBox(width: 5,),
        Text('Oppo A15') ,
        Container(child:FlatButton(child: Text('عرض التفاصيل الجهاز',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,decoration: TextDecoration.underline,color: Theme.of(context).primaryColor),),onPressed: (){


        },))


      ],)),
      SizedBox(height: 3,),
      Container(child:Row(children: [

        Container(decoration: BoxDecoration(
            color: Colors.green
            ,borderRadius:


        BorderRadius.all(Radius.circular(30))
        ),child: Padding(padding: EdgeInsets.only(top: 2,right: 6,left: 6,bottom: 2),child:Text(' الاستعلام ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor ),)),),
        SizedBox(width: 10,),
        Container(decoration: BoxDecoration(
            color: Colors.grey
            ,borderRadius:


        BorderRadius.all(Radius.circular(30))
        ),child: Padding(padding: EdgeInsets.only(top: 2,bottom: 2,right: 6,left: 6),child:Text(' التسليم ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor ),)),),




      ],)),
      SizedBox(height: 3,),
      Container(child:Row(children: [
        Text(' حالة الطلب   :',style: TextStyle(color: Colors.grey),),

        SizedBox(width: 5,),
        Text('تم رفضة طلب اثناء الاستعلام') ,



      ],)),
      SizedBox(height: 5,),
      




    ],)));

  }


  getdata()async{
    List x=['',''];
    var v=await http.get('https://httpbin.org/get');
    return x;

  }



}

