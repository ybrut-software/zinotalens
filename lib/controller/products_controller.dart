import 'package:flutter/material.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/services/api_client.dart';

import '../model/productlist_model.dart' as productList;
import '../model/search_list_model.dart' as searchList;

Future<List<productList.Product>> fetchProductList(BuildContext context) async {
  var rawJson = await ApiClient.getServices().fetchProductListApi();
  productList.ProductListModel productListModel =
      productList.productListModelFromJson(rawJson);
  return productListModel.product!;
}

Future<List<searchList.Product>> searchProducts(String searchValue) async {
  var jsonData = await ApiClient.getServices().searchProductsApi(searchValue);
  searchList.SearchListModel searchListModel =
      searchList.searchListModelFromJson(jsonData);
  return searchListModel.products!;
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
