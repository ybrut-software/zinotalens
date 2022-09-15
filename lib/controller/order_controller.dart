import 'dart:convert';

import 'package:zinotalens/model/order_list_model.dart';
import 'package:zinotalens/model/shipment_model.dart';
import 'package:zinotalens/services/api_client.dart';

Future<List<Order>> fetchOrdersList(String token) async {
  var data = await ApiClient.getServices().ordersListApi(token);
  OrderListModel orderListModel = orderListModelFromJson(data);
  return orderListModel.order!;
}

Future<Order> fetchOrderDetails(String token, String orderId) async {
  var data = await ApiClient.getServices().orderDetailApi(token, orderId);
  Map<String, dynamic> mapData = jsonDecode(data);
  Order order = Order.fromJson(mapData['order']);
  return order;
}

Future<Shipment> fetchShipmentDetails(String token, String shippingId) async {
  var data = await ApiClient.getServices().shippingDetailApi(token, shippingId);
  ShipmentModel shipmentModel = shipmentModelFromJson(data);
  return shipmentModel.shipment!;
}
