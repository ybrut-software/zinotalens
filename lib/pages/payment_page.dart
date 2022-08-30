import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/custom_appbar.dart';

import '../utils/colors.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isCartIcon: false),
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(),
              )
            ],
          ),
        )
      ]),
    );
  }
}
