import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/productlist_model.dart';
import 'package:zinotalens/utils/exception_handler.dart';

class ProductListProvider extends ChangeNotifier {
  List<Product> _productList = [];
  bool _isDataLoad = false;

  bool _isError = false;
  bool get isError => _isError;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;

  int get productsLength => _productList.length;
  List<Product> get productList => _productList;
  bool get isDataLoad => _isDataLoad;

  Future<void> getProductList() async {
    try {
      _isDataLoad = true;
      _productList = await fetchProductList();
      _productList.reversed;
      _isDataLoad = false;
      _isError = false;
    } catch (e) {
      print("error id 12 : $e");
      _isDataLoad = false;
      _isError = true;
      DioError dioError = e as DioError;
      String error = DioExceptions.fromDioError(dioError).toString();
      _errorMsg = error;
    }
    notifyListeners();
  }
}
