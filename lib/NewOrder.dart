import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants/isemail.dart';
import 'Constants/isphone.dart';
import 'Constants/widthandheight.dart';


class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: Container(height: getheight(context)/12,padding: EdgeInsets.all(10),child:RaisedButton(
      onPressed:(!load)?null: ()async{
        setState(() {
          load=true;
        });
        // Sigupp();




      },
      color: Theme.of(context).primaryColor,
      child:
      Text(
      'تاكيد الطلب',
        style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
      ),
    )),
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.close),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text('بيانات استلام الطلب',
        ),
        centerTitle: true,




      ),
      body:Directionality(child:Container(padding: EdgeInsets.all(20),child:
      ListView(children: [
        Text('الاسم الاول',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: name,
            onChanged: (val){
              setState((){
                load=isok();
                print(load);

              });
            },
            keyboardType: TextInputType.emailAddress,
            autocorrect: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true))
        ),
        SizedBox(height: 10,),
        Text('الاسم الاخير',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: lname,
            keyboardType: TextInputType.emailAddress,
            autocorrect: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true))
        ),
        SizedBox(height: 10,),
        Text('البريد الالكتروني',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: email,
            keyboardType: TextInputType.emailAddress,
            autocorrect: true,
            decoration: InputDecoration(
                hintText: 'example@example.com',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true))
        ),
        SizedBox(height: 10,),
        Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: phone,
            maxLength: 10,
            keyboardType: TextInputType.phone,
            autocorrect: true,
            decoration: InputDecoration(
                prefixText: '+20',
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true)

        )
        ),
        SizedBox(height: 10,),
        Text('رقم هاتف اخر *',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: anotherphone,
            maxLength: 10,
            keyboardType: TextInputType.phone,
            autocorrect: true,
            decoration: InputDecoration(
                prefixText: '+20',
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true)

        )
        ),
        SizedBox(height: 10,),
        Text('المحافظة',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:
        ListTile(title: Text('اختار المحافظة',style: TextStyle(color: Colors.grey),),trailing: Icon(Icons.arrow_drop_down),)

        ),
        SizedBox(height: 10,),
        Text('المنطقة',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        Directionality(textDirection: TextDirection.rtl,child:ListTile(title: Text('اختار المنطقة',style: TextStyle(color: Colors.grey),),trailing: Icon(Icons.arrow_drop_down),))
        ),
        SizedBox(height: 10,),


        Text('العنوان',style: TextStyle(fontWeight: FontWeight.bold),),
        Card(child:

        TextField(controller: address,
            keyboardType: TextInputType.text,
            autocorrect: true,
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                fillColor: Colors.grey.shade200,
                filled: true))
        ),
        Row(children: [

          Expanded(child:Column(children: [
            Text('رقم الطابق',style: TextStyle(fontWeight: FontWeight.bold),),
            Card(child:

            TextField(controller: floor,
                keyboardType: TextInputType.number,
                autocorrect: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    fillColor: Colors.grey.shade200,
                    filled: true))
            ),
          ],) ),
          Expanded(child:Column(children: [
            Text('رقم الشقة',style: TextStyle(fontWeight: FontWeight.bold),),
            Card(child:

            TextField(controller: flat,
                keyboardType: TextInputType.number,
                autocorrect: true,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    fillColor: Colors.grey.shade200,
                    filled: true))
            ),
          ],) ),




        ],),






      ],))
      ,textDirection: TextDirection.rtl,),);
  }




  bool load=false;


  TextEditingController name=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController anotherphone=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController floor=TextEditingController();
  TextEditingController flat=TextEditingController();
  String gaver_id='';
  String region_id='';
  shareddataget()async{

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();





  }
  bool isok(){
    print('name'+name.text.isEmpty.toString());
    print('lname'+lname.text.isEmpty.toString());
    print('address'+address.text.isEmpty.toString());
    print('email'+(!isemail(email.text)).toString());
    print('flat'+flat.text.isEmpty.toString());
    print('floor'+floor.text.isEmpty.toString());
    print('phone'+phone.text.isEmpty.toString());
    print('another'+anotherphone.text.isEmpty.toString());
    print('gaver'+(gaver_id==null).toString());
    print('region'+(region_id==null).toString());

    return (name.text.isEmpty||lname.text.isEmpty||address.text.isEmpty||!isemail(email.text)||
        flat.text.isEmpty||floor.text.isEmpty||!isphone(phone.text)||gaver_id==null||region_id==null)?false:true;

  }
}

