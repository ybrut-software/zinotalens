import 'package:flutter/material.dart';

import '../model/productlist_model.dart';

Future<List<ProductListModel>> fetchProductList(BuildContext context) async {
  var rawJson =
      await DefaultAssetBundle.of(context).loadString('lib/json/products.json');
  return productListModelFromJson(rawJson);
}

Future<ProductListModel> fetchProductDetails(BuildContext context,
    {required String productId}) async {
  var rawJson =
      await DefaultAssetBundle.of(context).loadString('lib/json/products.json');

  List<ProductListModel> productList = productListModelFromJson(rawJson);

  return productList[
      productList.indexWhere((element) => element.productId == productId)];
}
