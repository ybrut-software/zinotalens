import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/provider/order_provider.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/error_widgets.dart';
import 'package:zinotalens/widgets/order_detail_page_widget.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';

class OrderDetailsPage extends StatefulWidget {
  OrderDetailsPage({Key? key, required this.orderId}) : super(key: key);

  final orderId;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).fetchOrderDetailProvider(
        Provider.of<AuthProvider>(context, listen: false).getAuthToken,
        widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final token = Provider.of<AuthProvider>(context).getAuthToken;
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: "Order Details"),
      body: orderProvider.getIsOrderDetailLoading
          ? circularProgressIndicator()
          : RefreshIndicator(
              onRefresh: () =>
                  orderProvider.fetchOrderDetailProvider(token, widget.orderId),
              child: orderProvider.isError
                  ? errorWidget(errorMsg: orderProvider.errorMsg)
                  : ListView(
                      padding: EdgeInsets.only(top: 3, bottom: 20),
                      children: [
                          orderTrakingComponent(
                              order: orderProvider.getOrder,
                              shipment: orderProvider.getShipment),
                          SizedBox(height: 5),
                          downloadInvoiceButton(),
                          SizedBox(height: 5),
                          shippingAddressComponent(
                              address: orderProvider.getOrder.address!),
                          SizedBox(height: 5),
                          orderPricingDetails()
                        ]),
            ),
    );
  }
}
