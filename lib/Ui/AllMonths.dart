import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
class AllMonths extends StatefulWidget {
  @override
  _AllMonthsState createState() => _AllMonthsState();
}

class _AllMonthsState extends State<AllMonths> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade300,appBar: AppBar(title: Text('حساباتى'),),body:
    Padding(padding: EdgeInsets.all(10),child:
    ListView.builder(itemCount: 10,itemBuilder:(context,index){

      return
        Container(child:Column(children: [
          Container(width: getwidth(context)*.9,color: Theme.of(context).primaryColor,height: 40,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('#B74',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w900,color: Colors.white)),
            SizedBox(width: 10,),
            Text(':كود الحساب',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.grey),)

          ],),),
          Container(width: getwidth(context)*.9,color: Colors.white,child:Column(children: [

            Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              Text('   جنية 2000 ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w900,color:Theme.of(context).primaryColor)),
              SizedBox(width: 10,),
              Text(': اجمالي المدفوع',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.grey),)

            ],),
            Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              Text('   جنية 2000 ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w900,color:Theme.of(context).primaryColor)),
              SizedBox(width: 10,),
              Text(': اجمالي المدفوع',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.grey),)

            ],),
            Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              Text('   جنية 2000 ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w900,color:Theme.of(context).primaryColor)),
              SizedBox(width: 10,),
              Text(': اجمالي المدفوع',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.grey),)

            ],),



          ],))






        ],));

    }),));
  }
}
