import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/search_list_model.dart';

class ProductSearchProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isDataLoad = false;

  List<Product> get products => _products;
  int get productsLength => _products.length;

  bool get isDataLoad => _isDataLoad;

  set setIsDataLoad(bool isDataLoad) {
    _isDataLoad = isDataLoad;
    notifyListeners();
  }

  searchProductsResult(String searchValue) async {
    try {
      _products = await searchProducts(searchValue);
      _isDataLoad = false;
    } catch (e) {
      print("error no 965: $e");
      _isDataLoad = false;
    }
    notifyListeners();
  }

  clearSearchList() {
    _products.clear();
    notifyListeners();
  }
}
