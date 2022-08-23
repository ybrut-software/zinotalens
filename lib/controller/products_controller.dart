import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/services/api_client.dart';

import '../model/productlist_model.dart';

Future<List<Product>> fetchProductList(BuildContext context) async {
  var rawJson = await ApiClient.getServices().fetchProductListApi();
  ProductListModel productListModel = productListModelFromJson(rawJson);
  return productListModel.product!;
}

void addCartItem({required ProductAddCartModel productCart}) async {
  databaseHelper.insertProduct(productCart);
}

Future<List<ProductAddCartModel>> fetchCartItems() async {
  List<ProductAddCartModel> cartProducts =
      await databaseHelper.getProductCartList();

  print("cart products : $cartProducts");
  return cartProducts;
}
