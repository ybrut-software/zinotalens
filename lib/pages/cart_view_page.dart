import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/cart_item_viewholder.dart';

import '../utils/colors.dart';

class CartViewPage extends StatefulWidget {
  CartViewPage({Key? key}) : super(key: key);

  @override
  State<CartViewPage> createState() => _CartViewPageState();
}

class _CartViewPageState extends State<CartViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        title: Text("Cart", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 5, bottom: 50),
            children: [
              CartItemViewHolder(),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.gray,
                      blurRadius: 0.5,
                      offset: Offset(0.5, 0.5))
                ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child:
                          Text("Price Details", style: TextStyle(fontSize: 16)),
                    ),
                    Divider(thickness: 1, color: Colors.gray.withOpacity(0.2)),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Price"),
                                Text("₹999",
                                    style: TextStyle(color: Colors.gray))
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tax"),
                                Text("+ ₹199",
                                    style: TextStyle(color: Colors.gray))
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Convenience Fees"),
                                Text("FREE",
                                    style: TextStyle(color: Colors.gray))
                              ])
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total (incl. GST)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text("₹1198",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.skyBlue),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(18),
                            child: Text(
                              "SELECT ADDRESS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
