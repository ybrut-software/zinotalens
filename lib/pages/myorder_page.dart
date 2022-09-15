import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/model/order_list_model.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/provider/order_provider.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/order_item_viewholder.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';

class MyOrderPage extends StatefulWidget {
  MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).fetchOrderListProvider(
        Provider.of<AuthProvider>(context, listen: false).getAuthToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: "My Orders", isCartIcon: false),
      body: orderProvider.getIsLoading
          ? circularProgressIndicator()
          : ListView.builder(
              itemCount: orderProvider.getOrderListLength,
              itemBuilder: (context, index) {
                Order orders = orderProvider.orderList[index];
                return OrderItemsViewholder(context, orders);
              },
            ),
    );
  }
}
