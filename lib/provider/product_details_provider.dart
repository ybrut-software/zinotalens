import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/product_details_model.dart';
import 'package:zinotalens/utils/exception_handler.dart';

class ProductDetailsProvider extends ChangeNotifier {
  Product _product = Product();
  bool _isDataLoad = true;

  bool _isError = false;
  bool get isError => _isError;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;

  Product get getProduct => _product;
  bool get isDataLoad => _isDataLoad;

  void getProductDetail({required String productId}) async {
    try {
      _product = await fetchProductDetails(productId);
      _isDataLoad = false;
      _isError = false;
    } catch (e) {
      print("error no 823: $e");
      _isDataLoad = false;
      _isError = true;
      DioError dioError = e as DioError;
      String error = DioExceptions.fromDioError(dioError).toString();
      _errorMsg = error;
    }
    notifyListeners();
  }
}
