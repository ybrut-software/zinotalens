import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/order_item_viewholder.dart';

import '../utils/colors.dart';

class MyOrderPage extends StatefulWidget {
  MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: "My Orders", isCartIcon: false),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => OrderItemViewholder(context)),
    );
  }
}
