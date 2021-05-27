import 'package:flutter/cupertino.dart';

class Category {
  late int categoryId;
  late String categoryName;
  late String categoryDesc;
  late int parent;
  late Image image;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDesc,
    required this.parent,
    required this.image,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryDesc = json['categoryDesc'];
    parent = json['parent'];
    image = (json['image'] != null ? Image.fromJson(json['image']) : null)!;
  }
}

class Image {
  late String url;

  Image({required this.url});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['src'];
  }
}
