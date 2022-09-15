import 'package:flutter/material.dart';
import 'package:zinotalens/controller/order_controller.dart';
import 'package:zinotalens/model/shipment_model.dart';

import '../model/order_list_model.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orderList = [];
  Order _orderObj = Order();
  Shipment _shipmentObj = Shipment();
  bool _isLoading = true;
  bool _isOrderDetailLoading = true;

  List<Order> get orderList => _orderList;
  int get getOrderListLength => _orderList.length;

  Order get getOrder => _orderObj;
  Shipment get getShipment => _shipmentObj;

  bool get getIsOrderDetailLoading => _isOrderDetailLoading;

  bool get getIsLoading => _isLoading;

  void fetchOrderListProvider(String token) async {
    _orderList = await fetchOrdersList(token);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchOrderDetailProvider(String token, String orderId) async {
    _orderObj = await fetchOrderDetails(token, orderId);
    if (_orderObj.shipment != null) {
      _shipmentObj = await fetchShipmentDetails(token, _orderObj.shipment!);
    }
    _isOrderDetailLoading = false;
    notifyListeners();
  }
}
