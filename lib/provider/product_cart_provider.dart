import 'package:flutter/material.dart';
import 'package:zinotalens/controller/address_controller.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/pages/payment_options_page.dart';

import '../controller/cart_controller.dart';

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

  void increaseQuantity(String productId, int index) {
    ProductAddCartModel product = _cartItems.elementAt(index);
    int quantity = product.productQuantity! + 1;
    if (quantity <= 5)
      databaseHelper.updateQuantity(productId: productId, quantity: quantity);

    getCartItems();
  }

  void decrementQuantity(String productId, int index) {
    ProductAddCartModel product = _cartItems.elementAt(index);
    int quantity = product.productQuantity! - 1;
    if (quantity == 0) {
      _cartItems.removeAt(index);
      databaseHelper.deleteProduct(productId);
    } else
      databaseHelper.updateQuantity(productId: productId, quantity: quantity);

    getCartItems();
  }

  void clearCartDataProvider() {
    databaseHelper.clearCartTable();
    _cartItems.clear();
    _totalPrice = 0;
    notifyListeners();
  }

  void addCartItemProvider({required ProductAddCartModel productCart}) async {
    try {
      addCartItem(productCart: productCart);
      _cartItems.add(productCart);
    } catch (e) {
      print("error no 789 : $e");
    }
    notifyListeners();
  }

  bool isProductInCart({required ProductAddCartModel productObj}) {
    bool check = true;
    for (var product in _cartItems) {
      if (product.productId == productObj.productId)
        check = false;
      else
        check = true;
    }
    return check;
  }

  bool _isCartSavedLoader = false;
  bool get isCartSavedLoader => _isCartSavedLoader;
  set setIsCartSavedLoader(bool _isCartSavedLoader) {
    this._isCartSavedLoader = _isCartSavedLoader;
    notifyListeners();
  }

  void saveCartProvider(
      {required String token, required BuildContext context}) async {
    try {
      bool _isCartSaved = await saveCart(token, _cartItems);
      if (_isCartSaved) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PaymentOptionsPage()));
      }
      _isCartSavedLoader = false;
    } catch (e) {
      print("error no 235: $e");
      _isCartSavedLoader = false;
    }
    notifyListeners();
  }
}
