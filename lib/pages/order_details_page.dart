import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/order_detail_page_widget.dart';

import '../utils/colors.dart';

class OrderDetailsPage extends StatefulWidget {
  OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: "Order Details"),
      body: ListView(padding: EdgeInsets.only(top: 3, bottom: 20), children: [
        orderTrakingComponent(),
        SizedBox(height: 5),
        downloadInvoiceButton(),
        SizedBox(height: 5),
        shippingAddressComponent(),
        SizedBox(height: 5),
        orderPricingDetails()
      ]),
    );
  }
}
