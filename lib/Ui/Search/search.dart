import 'package:alandalous/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  bool lang;
  Search(this.lang);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String key='';
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: IconButton(icon: Icon(Icons.close),onPressed: (){
      Navigator.pop(context);

    },),title:
    Container(
      height:getheight(context)/15,
      alignment: Alignment.center,
      child:
      Container(width: getwidth(context)*.9,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 7,right: 7),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
              blurRadius: 5.0,
              offset: Offset(0,1),
            ),
          ],
        ),
        height: getheight(context)/17,
        child:
        TextField(onChanged: (pass){

setState(() {
  key=name.text;
});

        },controller: name,
          textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,
          textAlign: (widget.lang)?TextAlign.right:TextAlign.left,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color:Theme.of(context).primaryColor,
            fontFamily: 'mohab',
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search ,),
           border: InputBorder.none,
            hintText: (widget.lang)?'  ابحث عن العميل ؟ ':'What Do You Wont !',
            hintStyle:TextStyle(fontFamily: 'mohab',   color:Colors.grey,
            ),
          ),
        ),
      ),

    ),),
    body:  Directionality(textDirection: TextDirection.rtl,child:Container(child:
    ListView.builder(itemCount: 10, itemBuilder: (context, index) {
      return
        Item('مهاب ');
    }),
    )


      ,

    ));
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
}
