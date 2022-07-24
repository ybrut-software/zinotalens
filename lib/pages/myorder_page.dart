import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => OrderItemViewholder(context)),
    );
  }
}
