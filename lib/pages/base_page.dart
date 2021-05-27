import 'package:flutter/material.dart';
import 'package:shukranngrp/utils/ProgressHUD.dart';
import 'package:shukranngrp/widgets/widget_product_cart.dart';

class BasePage extends StatefulWidget {
  // BasePage({Key key}) : super(key: key);
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: Text(
          'Shrukrann',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget pageUI() {
    return Container(
        // child: ProductCard(data: product),
        );
  }
}
