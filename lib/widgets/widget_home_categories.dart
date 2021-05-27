import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shukranngrp/api_service.dart';
import 'package:shukranngrp/pages/product_page.dart';

class WidgetCategories extends StatefulWidget {
  @override
  _WidgetCategoriesState createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  late APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 10.0),
                  child: Text(
                    'All Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 4.0, right: 10.0),
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            //_categoriesList(),
            _buildCategoryList(),
          ],
        ),
      ),
    );
  }

  // Widget _categoriesList() {
  //   return FutureBuilder(
  //     future: apiService.getCategories(),
  //     builder: (
  //     BuildContext context,
  //         AsyncSnapshot<List<categoryModel.Category>> model
  //     ),{
  //       if(model.hashData){
  //         return _buildCategoryList(model.data);
  //       }
  //       return Center(
  //       child: CircularProgressIndicator(),
  //       );
  //   }
  //
  //   );
  // }

  Widget _buildCategoryList() {
    return Container(
      height: 150.0,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // itemCount: categories.length,
        itemBuilder: (context, index) {
          // var data = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductPage(), //category:data.categoryId
                  ),
                );
              });
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 80.0,
                  height: 80.0,
                  alignment: Alignment.center,
                  child: Image.network(
                    //data.image.url,
                    'https://i0.wp.com/www.shukranngrp.com/wp-content/uploads/2021/03/Virginia-Green-Garden-%E2%80%93-500-ML-%E2%80%93-12-Pieces-%E2%80%93-Shrink-Wrap.png?fit=300%2C300&ssl=1',
                    height: 80.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                Row(
                  children: [
                    // 'data.categoryName.toString()'
                    Text('Water'),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 14.0,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
