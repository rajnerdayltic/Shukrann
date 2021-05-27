// import 'package:flutter/material.dart';
// import 'package:shukranngrp/api_service.dart';
// import 'package:shukranngrp/models/product.dart';
//
// class SortBy {
//   String value;
//   String text;
//   String sortOrder;
//
//   SortBy({required this.value, required this.text, required this.sortOrder});
// }
//
// class ProductProvider with ChangeNotifier {
//   APIService _apiService;
//   List<Product> _productList;
//   SortBy _sortBy;
//   int pageSize = 10;
//
//   List<Product> get allProducts => _productList;
//   double get totalRecords => _productList.length.toDouble();
//
//   LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;
//   getLoadMoreStatus() => _loadMoreStatus;
//
//   ProductProvider() {
//     resetStreams();
//     _sortBy = SortBy(value: 'Modified', text: 'Latest', sortOrder: 'asc');
//   }
//   void resetStreams() {
//     _apiService = APIService();
//     _productList = List<Product>();
//   }
//
//   setLoadingState(LoadMoreStatus loadMoreStatus) {
//     _loadMoreStatus = loadMoreStatus;
//     notifyListeners();
//   }
//
//   setSortOrder(SortBy sortBy) {
//     _sortBy = sortBy;
//     notifyListeners();
//   }
//
//   fetchProducts(
//     pageNumber, {
//     String strSearch,
//     String tagName,
//     String categoryId,
//     String sortBy,
//     String sortOrder = 'asc',
//   }) async {
//     List<Product> itemModel = await _apiService.getProducts(
//       strSearch: strSearch,
//       tagName: tagName,
//       pageNumber: pageNumber,
//       pageSize: this.pageSize,
//       categoryId: categoryId,
//       sortBy: this._sortBy.value,
//       sortOrder: this._sortBy.sortOrder,
//     );
//     if (itemModel.length > 0) {
//       _productList.addAll(itemModel);
//     }
//     setLoadingState(LoadMoreStatus.STABLE);
//     notifyListeners();
//   }
// }
