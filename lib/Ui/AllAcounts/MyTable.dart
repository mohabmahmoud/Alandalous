import 'package:alandalous/Constants/color.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Ui/Controller/Controller.dart';
import 'package:alandalous/Widgets/MoneyTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {

  int selected=1;

  ScrollController _scrollController = new ScrollController();

  List months=['يناير','فبراير','مارس','ابريل','مايو','يونيو'];
  double page = 2.0;
  PageController pageController;

  int currentPage = 0;
  double viewPortFraction = 0.35;

  @override
  void initState() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return


     Directionality(textDirection: TextDirection.rtl,child: Column(children: [
      Container(decoration: BoxDecoration(color: HexColor('FF560F63'),


      borderRadius: BorderRadius.all(Radius.circular(10)),
      ),height:getheight(context)/12,child:





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
          itemCount: 6,
          itemBuilder: (context, index) {

            return Container(width: getwidth(context),child:Row(children: [
            Container(alignment: Alignment.center,width: getwidth(context)/3-1,child: Text(months[index+0],style: TextStyle(fontWeight: FontWeight.bold,color: currentPage==index?HexColor("FFBC4FEC"):Colors.white),)),

            ],));
          },
        ),
      ),








      ),
       SizedBox(height: 20,),
       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

    MoneyTitle( 'قيمة القسط', context,) ,
    MoneyTitle( 'قيمة المتأخر', context,) ,
    MoneyTitle( 'المدفوع', context,) ,
    MoneyTitle( 'المتبقي', context,) ,
       ],)











    ],));
  }
}
