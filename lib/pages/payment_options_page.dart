import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/provider/payment_provider.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/utils/style.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';

import '../utils/colors.dart';

class PaymentOptionsPage extends StatefulWidget {
  PaymentOptionsPage({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  List<String> paymentTitles = [
    "UPI",
    "Wallets",
    "Credit / Debit / ATM Card",
    "Cash on Delivery"
  ];
  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    final cartProvider = Provider.of<ProductCartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isCartIcon: false, title: "Payments"),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: contentContainerDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        "All Payments Options",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              title: Text(paymentTitles[index]),
                              onTap: () => paymentProvider.setIsSelected(index),
                              leading: Radio(
                                  value: index,
                                  groupValue: paymentProvider.getIsSelected,
                                  onChanged: (value) => {}),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              height: 0,
                              thickness: 1,
                              color: Colors.gray.withOpacity(0.3),
                            ),
                        itemCount: paymentTitles.length)
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      cartProvider.getTotalPrice.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    Expanded(
                        child: Container(
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {},
                          child: Text("CONTINUE")),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
