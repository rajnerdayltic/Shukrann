import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shukranngrp/pages/dashboard_page.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text(
              'Store',
              style: TextStyle(),
            ),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text(
              'My cart',
              style: TextStyle(),
            ),
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Favourite',
              style: TextStyle(),
            ),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text(
              'My Account',
              style: TextStyle(),
            ),
            icon: Icon(Icons.account_circle),
          ),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }
}
