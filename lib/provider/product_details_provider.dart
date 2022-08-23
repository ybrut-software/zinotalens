import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/productlist_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  //not necessary to pass context
  ProductDetailsProvider(this.context);
  final context;

  ProductListModel _product = ProductListModel();

  ProductListModel get product => _product;

  void getProductDetail({required String productId}) async {
    // _product = await fetchProductDetails(context, productId: productId);
    notifyListeners();
  }
}
