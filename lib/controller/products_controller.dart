import 'package:flutter/material.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/services/api_client.dart';

import '../model/product_details_model.dart' as productDetail;
import '../model/productlist_model.dart' as productList;
import '../model/search_list_model.dart' as searchList;

Future<List<productList.Product>> fetchProductList() async {
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

Future<productDetail.Product> fetchProductDetails(String productId) async {
  var jsonData = await ApiClient.getServices().fetchProductDetailApi(productId);
  productDetail.ProductDetailsModel productDetailsModel =
      productDetail.productDetailsModelFromJson(jsonData);
  return productDetailsModel.product!;
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
