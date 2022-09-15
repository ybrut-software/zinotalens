import 'package:zinotalens/model/order_list_model.dart';
import 'package:zinotalens/services/api_client.dart';

Future<List<Order>> fetchOrdersList(String token) async {
  var data = await ApiClient.getServices().ordersListApi(token);
  OrderListModel orderListModel = orderListModelFromJson(data);
  return orderListModel.order!;
}
