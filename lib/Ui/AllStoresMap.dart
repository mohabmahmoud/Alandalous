import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/Models/Parench.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart'as http;
class AllStores extends StatefulWidget {
  double lat;
  double lng;
  AllStores(this.lat,this.lng);

  @override
  _AllStoresState createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {


  Completer<GoogleMapController> _controller = Completer();
  bool isfrist=true;
  List All;
  @override
  void initState() {
    All=[Parench(name: 'ميدان الساعة',location:'ميدان الساعة امام الموقف بجوار كافيتريا النجدي وفرن العمدة-الساعة-فكتوريا',
    lat: 31.2438469,
      lng: 29.9830885,
      phone:'035255816'
    ),
      Parench(name: 'الساعة ابو سرحة',
          location:'الساعة ميدان ابو سرحة امام عصير لبنان',
          lat: 31.241121,
          lng: 29.9842577,
          phone:'035050019'
      ),
      Parench(name: 'محمد فريد',
          location:'شارع محمد فريد-بجوار مسجد فريد-سيدي بشر قبلي',
          lat: 31.2562485,
          lng: 30.0000048,
          phone:'035330397'
      ),
      Parench(name: 'شارع القاهرة',location:'شارع القاهرة-تقاطع محمد فريد -سيدي بشر قبلي',
          lat: 31.2606449,
          lng: 29.9976969,
          phone:'035265264'
      ),
      Parench(name: 'فرع العجمي',
          location:'اول شارع الحنفية-مع الاول البيطاش -امام الريف الديمشقي',
          lat: 31.123343,
          lng: 29.9976969,
          phone:'035255816'
      ),


    ];



setState(() {

});
for(int i=0;i<All.length;i++) {
  _markers.add(
      Marker(markerId: MarkerId(i.toString()), position: LatLng(All[i].lat, All[i].lng)));
}
setState(() {

});


    // TODO: implement initState
    super.initState();
  }


  List<Marker> _markers = [

  ];
  Widget _buildmap(){


  }
  @override
  Widget build(BuildContext context) {
    //print(widget.loc.Address_ar);
    return Scaffold(
     appBar:AppBar(title:
     Text('جميع فروعنا'),),
      body: Directionality(textDirection: TextDirection.rtl,child:Container(child:Column(children: <Widget>[
        Container(
          height: getheight(context)/3,

          child: Card(
            child: GoogleMap(onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lat, widget.lng),
                zoom: 11,
              ),
              markers: Set.from(_markers),

            zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
            ),
          ),),

        Expanded(child:
        ListView.builder(itemCount: 5,itemBuilder: (context,index){
          return InkWell(onTap: (){
            _goToTheLake(All[index].lat, All[index].lng);


          },child:Container(width: getwidth(context)*.9,child:Card(

            child: Row(children: [
        Container(height: getheight(context)/10,
        width: getheight(context)/10,
          child:FancyShimmerImage(errorWidget: Icon(Icons.info_outline,color: Colors.redAccent,),imageUrl: 'https://apollo-ireland.akamaized.net/v1/files/kyhnmdn61huz1-EG/image;s=644x461;olx-st/_1_.jpg',)
        ),
              Container(width: 10,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Row(children: [

                  Text(All[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ],),
                Row(children: [
                  Icon(Icons.location_on_outlined,size: 13,),
                  Container(width: getwidth(context)-(getheight(context)/10)-70,child:Expanded(child: Text(All[index].location,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.grey))),),
                ],),
                Row(children: [
                  Icon(Icons.phone,color: Colors.greenAccent,),
                  Text(All[index].phone,style: TextStyle(fontSize: 14),),
                ],),



              ],)


            ],),

          )));
        }))



      ],)), ));
  }




 


  Future<void> _goToTheLake(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 20,
    )));
  }

}
