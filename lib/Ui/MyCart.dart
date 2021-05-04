import 'package:alandalous/Constants/isphone.dart';

import '../Constants/widthandheight.dart';
import '../Constants/isemail.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mycart extends StatefulWidget {
  bool lang;
  Mycart(this.lang);
  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  double total=0.0;
  double y=0.0;
  final test = Map<String, int>();
  @override
  void initState() {
    getuserid();

    // TODO: implement initState
    super.initState();
  }

  String user_id;

Future too;
  getuserid()async{

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      user_id= sharedPreferences.getString('id');

    });



  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          bottomNavigationBar: Container(padding: EdgeInsets.only(left: 20,right: 20),height: 70,color: Theme.of(context).accentColor,child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,children: [
            Text((widget.lang)?': الاجمالى':'Total' ,style: TextStyle(fontFamily: 'mohab',color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
            Text(mohab.toString()+((widget.lang)?' جنية ':' LE '),textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontFamily: 'mohab',color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration:
              BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme
                      .of(context)
                      .primaryColor)),
              child: FlatButton(
                child: Text((widget.lang)?'تاكيد الطلب':'Confirm Order',style: TextStyle(fontFamily: 'mohab',color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                onPressed: () {
                  if(test.isEmpty){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text((widget.lang)?"خطا":'Error',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'mohab'),),
                            content: Text((widget.lang)?'السلة فارغة':'Empty Cart',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'mohab')),
                            actions: [
                              FlatButton(
                                child: Text((widget.lang)?"اغلاق":'Close',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'mohab'),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });



                  }  else {
                    ShowDialogorder(mohab.toString());
                  }


                },),
            ),


          ],)),appBar: AppBar(centerTitle: true,title:
      Text((widget.lang)?'العربة':'My Cart'),),body: Container(
          child:
          ListView.builder(
            itemCount: 10,
            itemBuilder:(context,index){
              return Container(child:Stack(children: [
              InkWell(onTap: (){


                }


              ,child: Card(child:
              Row(crossAxisAlignment: (widget.lang)?CrossAxisAlignment.start:CrossAxisAlignment.end,textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,children: [
              Image.network('https://cf1.s3.souqcdn.com/item/2020/10/07/13/18/84/11/1/item_L_131884111_b431d6d760a70.jpg',height:getheight(context)/7 ,width: getwidth(context)/3,fit: BoxFit.fill,),
              Container(padding: EdgeInsets.only(left: 5,right: 5),child:Column(crossAxisAlignment:(widget.lang)? CrossAxisAlignment.end:CrossAxisAlignment.start,children: [
                Text('mohab',
                  textDirection:(widget.lang)?TextDirection.rtl:TextDirection.ltr,
                  style: TextStyle(fontFamily: 'mohab',fontWeight: FontWeight.bold),),
             Text((widget.lang)?'سعر المنتج : '+'2000'+' جنية ':'Item Price: '+'2000'+' LE', textDirection:(widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontFamily: 'mohab',fontWeight: FontWeight.w600),),


              Row(crossAxisAlignment: CrossAxisAlignment.center ,textDirection:(widget.lang)?TextDirection.rtl:TextDirection.ltr,children: [
              Container(
              decoration: BoxDecoration(
              border: Border.all(
              width: 1.0
              ),
              borderRadius: BorderRadius.all(
              Radius.circular(20.0) //                 <--- border radius here
              ),
              ),height: 30,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              IconButton(icon: Icon(Icons.add,size: 16,),onPressed: ()async{

              },),
              Text('111',style: TextStyle(fontFamily: 'mohab',fontWeight: FontWeight.bold,fontSize: 13),),
              IconButton(icon: Icon(Icons.remove,size: 16,),onPressed: ()async{


              },),

              ],),),
              SizedBox(width: 20,),
              Text((widget.lang)?' جنية ':' LE '


              ,textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontFamily: 'mohab',color: Theme.of(context).primaryColor),),


              ],),
              SizedBox(height: 7,),



              ],))



              ],)



              )),

              (!widget.lang)?Positioned(right: 5,child: IconButton(icon: Icon(Icons.close),onPressed: ()async{


              },)):Container(width: 1,),
              (widget.lang)?Positioned(left: 5,child:
              IconButton(icon: Icon(Icons.close),onPressed: (){









              showDialog(
              context: context,
              builder: (BuildContext context) {
              return AlertDialog(
              content: Text((widget.lang)?'تاكيد الحذف من العربة':'Confirm Delete From Cart',
              textDirection: (widget.lang)?TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontFamily: 'mohab')),

              actions: [
              FlatButton(onPressed: (){
              Navigator.pop(context);
              }, child: Text((widget.lang)?'اغلاق':'Close' ,style: TextStyle(fontFamily: 'mohab'),)),
              FlatButton(onPressed: ()async{



              }, child: Text((widget.lang)?'تاكيد':'Confirm' ,style: TextStyle(fontFamily: 'mohab'),))],


              );
              });






              },)):Container(width: 1,),

              ],));


            } ,)

      ));

  }




 gett(){
   mohab=0;
   WidgetsBinding.instance.addPostFrameCallback((_){

     var values = test.values;
     mohab = values.reduce((sum, element) => sum + element);
     setState(() {

     });
     return mohab;
   });

 }

 int mohab=0;

  ShowDialogorder(String mohabb){
    bool h=false;
    double lat=null;
    double lng=null;
    String msg='';

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child:StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
           return
             Wrap(children: [
               AppBar(leading: Text(''),title: Text((widget.lang)?'تاكيد الطلب':'Confirm Order'),
               centerTitle: true,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 100,child:
                  RaisedButton(color: Colors.red,
                    child: Text((widget.lang)?"اغلاق":'Close',textDirection: TextDirection.rtl,style: TextStyle(fontFamily: 'mohab',fontWeight: FontWeight.bold,color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },





                  )),
                  Container(width: 100,child: RaisedButton(color: Theme.of(context).primaryColor,
                    child: Text((widget.lang)?"تاكيد":'Confirm',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'mohab',color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: () {
                    Navigator.pop(context);
                      OpensignupPanel();
/*
 if(phone.text.length==9)    {
   setState((){
     msg='';
   });

   ShowLoader();

   FirebaseFirestore.instance
                          .collection('Order').add({

                        'time':DateTime.now(),
                        'user_id':user_id,
                        'lat':lat,
                        'lng':lng,
                        'status':1


                      }).then((val){

                        FirebaseFirestore.instance
                            .collection('carts').where('user_id',isEqualTo: user_id).where('order_id',isEqualTo: '')
                            .get().then((value){
                          for (var x in value.docs){
                            print(x.get('store_id'));

                            FirebaseFirestore.instance
                                .collection('carts').doc(x.documentID).update({
                              'status':1,
                              'order_id':val.documentID

                            });


                          }


                        });
                        setState(() {
                          mohab=0;
                        });

Navigator.pop(context);
Navigator.pop(context);
Ok();


                      });

                  }
 else{
setState((){
  msg=(widget.lang)?'تاكد من الرقم الهاتف':'Check your PhoneNumber';
});

 }*/



                    },





                  )),
                ],

              ),
             Text(msg,style: TextStyle(fontFamily: 'mohab',color: Colors.red),)


            ],);
                }),

          );
        });


  }

ShowLoader() {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text((widget.lang)?'جار الطلب':'Loading...',style: TextStyle(fontFamily: 'mohab'),),

        );
      });
}


Ok(){

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text((widget.lang)?'تم الطلب بنجاح سيفوم مركز السحن بتواصل معك لاستلام الطلب':'The request is successful. The shipping center will contact you to receive the order',style: TextStyle(fontFamily: 'mohab')),

        actions: [FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text((widget.lang)?'اغلاق':'Close' ,style: TextStyle(fontFamily: 'mohab'),))],);
      });
}




bool load=false;
  OpensignupPanel(){
    final double statusBarHeight = MediaQuery.of(context).padding.top;


    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState /*You can rename this!*/){
                  return Container(padding: EdgeInsets.only(top: statusBarHeight),height: getheight(context),child:
                  Scaffold(bottomNavigationBar: Container(height: getheight(context)/12,padding: EdgeInsets.all(10),child:RaisedButton(
                    onPressed:(!load)?null: ()async{
                      setState(() {
                        load=true;
                      });
                     // Sigupp();




                    },
                    color: Theme.of(context).primaryColor,
                    child:
                    Text((widget.lang)?
                    'تاكيد الطلب':'Confirm Order',
                      style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  )),
                    appBar: AppBar(
                      leading: IconButton(icon:Icon(Icons.close),onPressed: (){
                        Navigator.pop(context);
                      },),
                      title: Text((widget.lang)? 'بيانات استلام الطلب':'Order Information',
                      ),
                      centerTitle: true,




                    ),
                    body:Container(padding: EdgeInsets.all(20),child:
                    ListView(children: [
                      Text((widget.lang)?'الاسم الاول':'First Name',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                      Text((widget.lang)?'الاسم الاخير':'Last Name',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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


                      Text((widget.lang)?'البريد الالكتروني':'Email',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                      Text((widget.lang)?'رقم الهاتف':'Phone Number',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                      Text((widget.lang)?'رقم هاتف اخر *':'Another Phone Number *',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                      Text((widget.lang)?'المحافظة':'Gavernment',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
                      Card(child:

                      Directionality(textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,child:ListTile(title: Text((widget.lang)?'اختار المحافظة':'Select Gavernment',style: TextStyle(color: Colors.grey),),trailing: Icon(Icons.arrow_drop_down),))
                      ),
                      SizedBox(height: 10,),
                      Text((widget.lang)?'المنطقة':'Region',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
                      Card(child:

                      Directionality(textDirection: TextDirection.rtl,child:ListTile(title: Text((widget.lang)?'اختار المنطقة':'Select Region',style: TextStyle(color: Colors.grey),),trailing: Icon(Icons.arrow_drop_down),))
                      ),
                      SizedBox(height: 10,),


                      Text((widget.lang)?'العنوان':'Address',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Text((widget.lang)?'رقم الطابق':'Floor Number',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Text((widget.lang)?'رقم الشقة':'Flat Number',textDirection:(widget.lang)? TextDirection.rtl:TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
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
                    ,));
                });});

  }

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