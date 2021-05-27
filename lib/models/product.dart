import 'package:email_validator/email_validator.dart';

class Product {
  late int id;
  late String name;
  late String description;
  late String shortDescription;
  late String sku;
  late String price;
  late String regularPrice;
  late String salesPrice;
  late String stockStatus;
  late List<Images> images;
  late List<Categories> categories;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salesPrice,
    required this.stockStatus,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salesPrice = json['sale_price'];
    stockStatus = json['stock_status'];

    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
  }
}

class Categories {
  late int id;
  late String name;

  Categories({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  Categories.fromJson(v);
}

class Images {
  late String src;

  Images({required this.src});

  Images.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}
