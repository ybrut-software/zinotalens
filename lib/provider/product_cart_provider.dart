import 'package:flutter/material.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';

class ProductCartProvider extends ChangeNotifier {
  List<ProductAddCartModel> _cartItems = [];
  int _totalPrice = 0;

  List<ProductAddCartModel> get cartItemList => _cartItems;

  int get cartItemLength => _cartItems.length;

  int get getTotalPrice => _totalPrice;

  void getCartItems() async {
    try {
      _cartItems = await fetchCartItems();
      _totalPrice = calculateTotalPrice();
    } catch (e) {
      print("error no 456 : $e");
    }
    notifyListeners();
  }

  int calculateTotalPrice() {
    var total = 0;
    for (var product in _cartItems) {
      total += product.productSellingPrice! * product.productQuantity!;
    }
    return total;
  }

  void clearCartDataProvider() {
    databaseHelper.clearCartTable();
    _cartItems.clear();
    _totalPrice = 0;
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
