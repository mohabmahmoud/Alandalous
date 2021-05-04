import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'model.dart';
class MyMoney extends StatefulWidget {
  @override
  _MyMoneyState createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(appBar: AppBar(title: Text('رصيدك الحالى'),),
    body: ListView(children: [
      Container(alignment: Alignment.center,width: getwidth(context)/3,child:

      Column(children: [
        Image.asset('images/money.png',height: getwidth(context)/5,width: getwidth(context)/5,color: Theme.of(context).primaryColor,),

        Text('رصيدك الحالى',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
        Text('1000 جنية',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor),),
      ],)
        ,),
      /*Container(
          padding: EdgeInsets.all(10),
          width: getwidth(context)/2,
          height: getheight(context)/3
          ,child:charts.BarChart(
          series,
          animate: true
      )),*/

      Expanded(child:ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 20,itemBuilder: (context,index){
        return ListTile(trailing: Container(decoration: BoxDecoration(
            color: Colors.red
            ,borderRadius:


        BorderRadius.all(Radius.circular(30))
        ),child: Padding(padding: EdgeInsets.only(right: 6,left: 6),child:Text('100+',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor ),)),),title: Text('تم اضافة 100جنية لحسابك'), subtitle: Text('يوم 15-7-2021'),leading: Icon(Icons.language,color: Colors.grey,),);
      },))



    ],),

    ));
  }



  List<charts.Series<SubscriberSeries, String>> series = [
    charts.Series(
        id: "Subscribers",
        data:  [
          SubscriberSeries(
  year: "2015",
  subscribers: 5500000,
  barColor: charts.ColorUtil.fromDartColor(Colors.red),
  ),
          SubscriberSeries(
            year: "2008",
            subscribers: 10000000,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue),
          ),
          SubscriberSeries(
            year: "2006",
            subscribers: 11000000,
            barColor: charts.ColorUtil.fromDartColor(Colors.black),
          ),
          SubscriberSeries(
            year: "2010",
            subscribers: 12000000,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue),
          ),
          SubscriberSeries(
            year: "2090",
            subscribers: 100,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue),
          ),
          SubscriberSeries(
            year: "2010",
            subscribers: 12000000,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue),
          ),
          SubscriberSeries(
            year: "2080",
            subscribers: 12000000,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue),
          ),

  ],
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor)
  ];

}
