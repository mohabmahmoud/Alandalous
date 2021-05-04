import 'package:alandalous/Constants/Colors.dart';
import 'package:alandalous/Constants/widthandheight.dart';
import 'package:alandalous/MainWidgets/ShamerImage.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
Widget Home_Offer_Slider(BuildContext context){
  return SizedBox(
      height:getheight(context)/5,
      child: Carousel(
        images: [
          Shamer_Image('https://cms.souqcdn.com/cms/boxes/img/desktop/L_1475685198_mobiles-ar.jpg'),
          Shamer_Image('https://arabic.leadsdubai.com/wp-content/uploads/%D8%A5%D8%B9%D9%84%D8%A7%D9%86%D8%A7%D8%AA-%D8%A7%D9%84%D8%B5%D8%AD%D9%81.png'),
          Shamer_Image('https://cms.souqcdn.com/cms/boxes/img/desktop/L_1475685198_mobiles-ar.jpg'),
          Shamer_Image('https://cms.souqcdn.com/cms/boxes/img/desktop/L_1475685198_mobiles-ar.jpg'),

        ],
        dotSize: 3.0,
        dotSpacing: 15.0,
        dotColor:ShadowColor.withOpacity(.7),
        dotIncreasedColor: AccentColor,
        indicatorBgPadding: 1.0,
        dotBgColor:   PrimaryColor.withOpacity(.3),
      )
  );

}
