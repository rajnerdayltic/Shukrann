import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shukranngrp/api_service.dart';
import 'package:shukranngrp/provider/product_provider.dart';
import 'package:shukranngrp/widgets/widget_product_cart.dart';

class ProductPage extends StatefulWidget {
  // ProductPage({Key key, this.categoryId}) : super(key: key);
  //
  // int categoryId;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late APIService apiService;
  final _sortByOptions = [
    // SortBy(value: 'popularity', text: 'Popularity', sortOrder: 'asc'),
    // SortBy(value: 'modified', text: 'Latest', sortOrder: 'asc'),
    // SortBy(value: 'price', text: 'Price Low to High', sortOrder: 'desc'),
    // SortBy(value: 'price', text: 'Price High to Low', sortOrder: 'desc'),
  ];
  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Product product = new Product();
    // product.name = 'Tea Bags';
    // product.regularPrice = '100';
    // product.salePrice='50';
    // product.images=new List<Images>();

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
      body: Column(
        children: [
          _productsFilter(),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
              // itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productsFilter() {
    return Container(
      height: 51.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFE6E6EC),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE6E6EC),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: PopupMenuButton(
              onSelected: (sortBy) {},
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child: Container(
                      child: Text(item.text),
                    ),
                  );
                }).toList();
              },
              icon: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}
