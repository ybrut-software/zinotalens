import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/model/product_addcart_model.dart';

class ProductCartProvider extends ChangeNotifier {
  List<ProductAddCartModel> _cartItems = [];

  List<ProductAddCartModel> get cartItemList => _cartItems;

  int get cartItemLength => _cartItems.length;

  void getCartItems() async {
    try {
      _cartItems = await fetchCartItems();
    } catch (e) {
      print("error no 456 : $e");
    }
    notifyListeners();
  }

  void addCartItemProvider(
      {required String productId, required double price, int? quantity}) async {
    ProductAddCartModel productCart = ProductAddCartModel(
        product_id: productId, product_price: price, product_quantity: 1);
    try {
      addCartItem(productCart: productCart);
      _cartItems.add(productCart);
    } catch (e) {
      print("error no 789 : $e");
    }
    notifyListeners();
  }
}
