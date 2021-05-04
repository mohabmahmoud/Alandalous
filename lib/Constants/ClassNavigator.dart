import 'package:flutter/cupertino.dart';

class SecondPageRoute extends CupertinoPageRoute {
  StatefulWidget next_page;
  SecondPageRoute(this.next_page):super(builder: (BuildContext context) =>  next_page);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: next_page);
  }



}