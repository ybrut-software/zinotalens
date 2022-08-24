import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/product_details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  Product _product = Product();
  bool _isDataLoad = true;

  Product get getProduct => _product;
  bool get isDataLoad => _isDataLoad;

  void getProductDetail({required String productId}) async {
    try {
      _product = await fetchProductDetails(productId);
      _isDataLoad = false;
    } catch (e) {
      print("error no 823: $e");
      _isDataLoad = false;
    }
    notifyListeners();
  }
}
