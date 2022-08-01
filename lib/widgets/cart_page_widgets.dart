import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';

Widget cartPriceDetails() => Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Text("Price Details", style: TextStyle(fontSize: 16)),
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
                      Text("₹999", style: TextStyle(color: Colors.gray))
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tax"),
                      Text("+ ₹199", style: TextStyle(color: Colors.gray))
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Convenience Fees"),
                      Text("FREE", style: TextStyle(color: Colors.gray))
                    ])
              ],
            ),
          )
        ],
      ),
    );
