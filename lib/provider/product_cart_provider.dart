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
      {required String productId,
      required int sellingPrice,
      int? listingPrice,
      required String title,
      required String size,
      required String photo,
      int quantity = 1}) async {
    ProductAddCartModel productCart = ProductAddCartModel(
        productId: productId,
        productTitle: title,
        productPhoto: photo,
        productSize: size,
        productListingPrice: listingPrice,
        productSellingPrice: sellingPrice,
        productQuantity: quantity);
    try {
      addCartItem(productCart: productCart);
      _cartItems.add(productCart);
    } catch (e) {
      print("error no 789 : $e");
    }
    notifyListeners();
  }
}
