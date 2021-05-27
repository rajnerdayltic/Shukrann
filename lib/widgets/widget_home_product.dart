import 'package:flutter/material.dart';
import 'package:shukranngrp/api_service.dart';

class WidgetHomeProducts extends StatefulWidget {
  // WidgetHomeProducts({required Key key,required this.labelName,required this.tagId})
  // :super(key: key);
  //
  // String labelName;
  // String tagId;
  @override
  _WidgetHomeProductsState createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  late APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F7FA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 4.0),
                child: Text(
                  //this.widget.labelName,
                  'Water 1 Ltr',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 4.0),
                child: FlatButton(
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          _buildList(),
        ],
      ),
    );
  }
  //
  // Widget _productList() {
  //   return FutureBuilder(
  //       future: apiService.getProducts(tagName: this.widget.tagId),
  //       builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
  //         if (model.hasdData) {
  //           return _buildList(model.data);
  //         }
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  // }

  Widget _buildList() {
    //List<Product> items
    return Container(
      height: 200.0,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          // itemCount: items.length,
          itemBuilder: (context, index) {
            // var data=items[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 130.0,
                  height: 120.0,
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://i1.wp.com/www.shukranngrp.com/wp-content/uploads/2021/03/WhatsApp-Image-2021-03-03-at-12.36.12.jpeg?w=500&ssl=1',
                    height: 120.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 130.0,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Melita Honey',
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0, left: 4.0),
                  alignment: Alignment.centerLeft,
                  width: 130,
                  child: Row(
                    children: [
                      Text(
                        //${data.regularPrice},
                        'د.إ235',
                        style: TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        //${data.salesPrice}
                        'د.إ185',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
