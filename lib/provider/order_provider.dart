import 'package:flutter/material.dart';
import 'package:zinotalens/controller/order_controller.dart';

import '../model/order_list_model.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orderList = [];
  bool _isLoading = true;

  List<Order> get orderList => _orderList;
  int get getOrderListLength => _orderList.length;

  bool get getIsLoading => _isLoading;
  set setIsLoading(bool _isLoading) => this._isLoading = _isLoading;

  void fetchOrderListProvider(String token) async {
    _orderList = await fetchOrdersList(token);
    _isLoading = false;
    notifyListeners();
  }
}
