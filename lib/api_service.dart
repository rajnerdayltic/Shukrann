import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shukranngrp/config.dart';
import 'package:shukranngrp/models/customer.dart';
import 'package:shukranngrp/models/login_model.dart';

import 'models/product.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );
    bool ret = false;

    try {
      var response = await Dio().post(
        Config.url + Config.customerURL,
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  // Future<LoginResponseModel> loginCustomer(String username, String password) async {
  //   LoginResponseModel model;
  //
  //   try{
  //     var response=await Dio().post(Config.tokenUrl,
  //     data: {
  //       'username':username;
  //       'password':password;
  //     },
  //     options: Options(
  //       headers:{HttpHeaders.contentTypeHeader:"application/x-www-form-urlencoded",}
  //     ),
  //     );
  //     if(response.statusCode==200){
  //       model=LoginResponseModel.fromJson(response.data);
  //     }
  //
  //   }on DioError catch(e){
  //     print(e.message);
  //   }
  //   return model;
  // }
  // Future<List<Category>?> getCategories() async {
  //   List<Category>? data = <Category>[];
  //   try {
  //     String url = Config.url +
  //         Config.categoriesUrl +
  //         "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
  //     var response = await Dio().get(
  //       url,
  //       options: Options(headers: {
  //         HttpHeaders.contentTypeHeader: 'application/json',
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       data = (response.data as List)
  //           .map(
  //             (i) => Category.fromJson(i),
  //           ).cast<Category>()
  //           .toList();
  //     }
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  //   return data;
  // }

  // Future<List<Product>> getProducts(
  //     {int pageNumber,
  //     int pageSize,
  //     String strSearch,
  //     String tagName,
  //     String categoryId,
  //     String sortBy,
  //     String sortOrder = 'asc'}) async {
  //   List<Product> data = new List<Product>();
  //
  //   try {
  //     String parameter = '';
  //
  //     parameter += '&search=$strSearch';
  //     parameter += '&per_page=$pageSize';
  //     parameter += '&page=$pageNumber';
  //     parameter += '&tag=$tagName';
  //     parameter += '&category=$categoryId';
  //     parameter += '&orderBy=$sortBy';
  //     parameter += '&order=$sortOrder';
  //
  //     String url = Config.url +
  //         Config.productsUrl +
  //         "?consumer_key=${Config.key}&consumer_secret=${Config.secret}${parameter.toString()}";
  //     var response = await Dio().get(
  //       url,
  //       options: Options(
  //         headers: {
  //           HttpHeaders.contentTypeHeader: 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       data = (response.data as List)
  //           .map(
  //             (i) => Product.fromJson(i),
  //           )
  //           .toList();
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  //   return data;
  // }
}
