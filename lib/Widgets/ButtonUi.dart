import '../Constants/widthandheight.dart';
import 'package:flutter/material.dart';
class MainButtonsUi extends StatefulWidget {
  String title;
  var fun;
  bool load;
  MainButtonsUi(this.title,this.fun,this.load );
  @override
  _MainButtonsUiState createState() => _MainButtonsUiState();
}

class _MainButtonsUiState extends State<MainButtonsUi> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: (widget.load) ? null : widget.fun,
      child: Container(
        height: getheight(context) / 13,
        width: getwidth(context) * .9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child:
        Text(
          widget.title,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}


