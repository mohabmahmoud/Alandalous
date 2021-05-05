import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/Controller/Controller.dart';
import 'package:flutter/material.dart';
class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return


      SingleChildScrollView(scrollDirection: Axis.horizontal,controller: _scrollController,child:Column(children: [
      Container(height:50,child:ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),scrollDirection: Axis.horizontal,itemCount: 12,itemBuilder: (context, index) {
        return

          (index==0)?Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.white
              ,borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),

              )

          ),width: getwidth(context)/3,height: 30,


              child: Text('حركة الدفع',style: TextStyle(fontWeight: FontWeight.bold),)

          ):
          Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.white
              ,borderRadius: BorderRadius.only(
                topRight: Radius.circular((index==0)?10:0),
                topLeft: Radius.circular((index==11)?10:0) ,

              )

          ),width: getwidth(context)/5,height: 30,


              child: Text(' شهر${index}',style: TextStyle(fontWeight: FontWeight.bold),)

          );
      },
        separatorBuilder: (context, index) {
          return VerticalDivider(width: 2,);
        },


      ),),
      Divider(height: 2,),
      Container(height:50,child:ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),controller: _scrollController,scrollDirection: Axis.horizontal,itemCount: 12,itemBuilder: (context, index) {
        return

          (index==0)?Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.grey
            ,),width: getwidth(context)/3,height: 30,


              child: Text('قيمة القسط',style: TextStyle(fontWeight: FontWeight.bold),)

          ):
          Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.grey
              ,borderRadius: BorderRadius.only(

              )

          ),width: getwidth(context)/5,height: 30,


              child: Text(' ${1000}',style: TextStyle(fontWeight: FontWeight.bold),)

          );
      },
        separatorBuilder: (context, index) {
          return VerticalDivider(width: 2,);
        },)),
      Divider(height: 2,),
      Container(height:50,child:ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),controller: _scrollController,scrollDirection: Axis.horizontal,itemCount: 12,itemBuilder: (context, index) {
        return

          (index==0)?Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.white
            ,),width: getwidth(context)/3,height: 30,


              child: Text('المدفوع',style: TextStyle(fontWeight: FontWeight.bold),)

          ):
          Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.white
              ,borderRadius: BorderRadius.only(

              )

          ),width: getwidth(context)/5,height: 30,


              child: Text(' ${index*100}',style: TextStyle(fontWeight: FontWeight.bold),)

          );
      },
        separatorBuilder: (context, index) {
          return VerticalDivider(width: 2,);
        },)),
      Divider(height: 2,),
      Container(height:50,child:ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),controller: _scrollController,scrollDirection: Axis.horizontal,itemCount: 12,itemBuilder: (context, index) {
        return

          (index==0)?Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.grey,

              borderRadius: BorderRadius.only(
              bottomRight:    Radius.circular(10)

          )

        ,),width: getwidth(context)/3,height: 30,



              child: Text('المتبقي',style: TextStyle(fontWeight: FontWeight.bold),)

          ):
          Container(alignment: Alignment.center,decoration: BoxDecoration(color:Colors.grey
              ,borderRadius: BorderRadius.only(
                bottomLeft:    Radius.circular((index==11)?10:0)

              )

          ),width: getwidth(context)/5,height: 30,


              child: Text(' ${index*100}',style: TextStyle(fontWeight: FontWeight.bold),)

          );
      },
        separatorBuilder: (context, index) {
          return VerticalDivider(width: 2,);
        },)),





    ],));
  }
}
