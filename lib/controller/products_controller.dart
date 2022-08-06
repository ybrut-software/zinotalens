import 'package:flutter/material.dart';

import '../model/productlist_model.dart';

Future<List<ProductListModel>> fetchProductList(BuildContext context) async {
  var rawJson =
      await DefaultAssetBundle.of(context).loadString('lib/json/products.json');
  return productListModelFromJson(rawJson);
}
