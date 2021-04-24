import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
class BannerImage extends StatefulWidget {
  @override
  _BannerImageState createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/bracelate.png'),
          AssetImage('images/BANNER2.png'),
          AssetImage('images/BANNER_TRY.png'),
          AssetImage('images/earrings.png'),
        ],
        autoplay: true,
        indicatorBgPadding: 2.0,
        dotSize: 10.0,
        dotBgColor: Colors.transparent,
        dotColor: Colors.greenAccent,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 300),
        dotIncreasedColor: Colors.red,
      ),
    );
  }
}
 