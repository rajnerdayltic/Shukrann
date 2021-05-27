// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shukranngrp/widgets/widget_home_categories.dart';
import 'package:shukranngrp/widgets/widget_home_product.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            WidgetCategories(),
            WidgetHomeProducts(),
            WidgetHomeProducts(),
            WidgetHomeProducts(),
          ],
        ),
      ),
    );
  }

  // Widget imageCarousel(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 200.0,
  //     child: Carousel(
  //       overlayShadow: false,
  //       borderRadius: true,
  //       boxFit: BoxFit.none,
  //       autoplay: true,
  //       dotSize: 4.0,
  //       images: [
  //         NetworkImage(
  //             'https://www.water.com/files/images/LH-template/bottled-water-products_product-grouping_water.jpg')
  //       ],
  //     ),
  //   );
  // }
}
