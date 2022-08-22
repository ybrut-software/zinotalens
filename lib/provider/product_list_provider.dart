import 'package:flutter/widgets.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/productlist_model.dart';

class ProductListProvider extends ChangeNotifier {
  //not necessary to pass context
  ProductListProvider(this.context);

  final context;
  List<Product> _productList = [];

  int get productsLength => _productList.length;
  List<Product> get productList => _productList;

  void getProductList() async {
    try {
      _productList = await fetchProductList(context);
    } catch (e) {
      print("error id 12 : $e");
    }
    notifyListeners();
  }
}
