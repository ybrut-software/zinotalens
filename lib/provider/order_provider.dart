import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zinotalens/controller/order_controller.dart';
import 'package:zinotalens/model/shipment_model.dart';
import 'package:zinotalens/utils/exception_handler.dart';

import '../model/order_list_model.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orderList = [];
  Order _orderObj = Order();
  Shipment _shipmentObj = Shipment();
  bool _isLoading = true;
  bool _isOrderDetailLoading = true;

  bool _isError = false;
  bool get isError => _isError;
  String _errorMsg = "";
  String get errorMsg => _errorMsg;

  List<Order> get orderList => _orderList;
  int get getOrderListLength => _orderList.length;

  Order get getOrder => _orderObj;
  Shipment get getShipment => _shipmentObj;

  bool get getIsOrderDetailLoading => _isOrderDetailLoading;

  bool get getIsLoading => _isLoading;

  void fetchOrderListProvider(String token) async {
    try {
      _orderList = await fetchOrdersList(token);
      _isLoading = false;
      _isError = false;
    } catch (e) {
      print("error no 365 : $e");
      _isLoading = false;
      _isError = true;
      DioError dioError = e as DioError;
      String error = DioExceptions.fromDioError(dioError).toString();
      _errorMsg = error;
    }

    notifyListeners();
  }

  Future<void> fetchOrderDetailProvider(String token, String orderId) async {
    try {
      _orderObj = await fetchOrderDetails(token, orderId);
      if (_orderObj.shipment != null) {
        _shipmentObj = await fetchShipmentDetails(token, _orderObj.shipment!);
      }
      _isOrderDetailLoading = false;
      _isError = false;
    } catch (e) {
      print("error no 829: $e");
      _isOrderDetailLoading = false;
      _isError = true;
      DioError dioError = e as DioError;
      String error = DioExceptions.fromDioError(dioError).toString();
      _errorMsg = error;
    }
    notifyListeners();
  }
}
