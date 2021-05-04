import 'package:flutter/material.dart';
class MoreListitem extends StatefulWidget {
  String tit;
  String sub;
  var icon;
  var fun;
  MoreListitem(this.tit,this.sub,this.icon,this.fun);
  @override
  _MoreListitemState createState() => _MoreListitemState();
}

class _MoreListitemState extends State<MoreListitem> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),child:
    RaisedButton(color:Theme.of(context).primaryColor,child:
    ListTile(leading: Icon(widget.icon,color: Colors.white,),title: Text(widget.tit,style: TextStyle(color: Colors.white),),
      subtitle: Text(widget.sub,maxLines: 1,style: TextStyle(color: Colors.white),),

    ),onPressed: widget.fun));
  }
}
