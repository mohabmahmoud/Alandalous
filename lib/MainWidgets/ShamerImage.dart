import 'package:alandalous/Constants/Colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

Widget Shamer_Image(String image){

 return FancyShimmerImage(imageUrl:image,shimmerBaseColor:PrimaryColor.withOpacity(.5) ,errorWidget: Icon(Icons.info_outline_rounded,color: Colors.redAccent,),);

}