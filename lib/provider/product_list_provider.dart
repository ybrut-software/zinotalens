import 'package:flutter/widgets.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/productlist_model.dart';

class ProductListProvider extends ChangeNotifier {
  List<Product> _productList = [];
  bool _isDataLoad = false;

  int get productsLength => _productList.length;
  List<Product> get productList => _productList;
  bool get isDataLoad => _isDataLoad;

  Future<void> getProductList() async {
    try {
      _isDataLoad = true;
      _productList = await fetchProductList();
      _productList.reversed;
      _isDataLoad = false;
    } catch (e) {
      print("error id 12 : $e");
      _isDataLoad = false;
    }
    notifyListeners();
  }
}
