import 'dart:convert';

import 'package:zinotalens/services/api_client.dart';

import '../main.dart';
import '../model/product_addcart_model.dart';

void addCartItem({required ProductAddCartModel productCart}) async {
  databaseHelper.insertProduct(productCart);
}

Future<List<ProductAddCartModel>> fetchCartItems() async {
  List<ProductAddCartModel> cartProducts =
      await databaseHelper.getProductCartList();

  print("cart products : $cartProducts");
  return cartProducts;
}

Future<bool> saveCart(
    String token, List<ProductAddCartModel> productCartList) async {
  Map<String, dynamic> cartObj = {
    "cart": {
      "products": List<dynamic>.from(productCartList.map((x) => x.toMap()))
    }
  };
  var cartBody = jsonEncode(cartObj);
  var resJson = await ApiClient.getServices().saveCartApi(token, cartBody);
  print(resJson);
  Map<String, dynamic> response = jsonDecode(resJson);
  return response["success"];
}
