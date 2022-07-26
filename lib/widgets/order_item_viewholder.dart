import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/order_details_page.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

Widget OrderItemViewholder(BuildContext context) => ElevatedButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderDetailsPage())),
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.gray.withOpacity(0.1)),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(frontFrame),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivered on Aug 16",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Vincent Chase Gold Green Full Rim Rounded",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.gray),
                      )
                    ],
                  )),
              Expanded(
                  child: Center(
                      child: Icon(
                Icons.chevron_right,
                color: Colors.black,
              )))
            ],
          ),
          Divider(
            color: Colors.gray.withOpacity(0.3),
            thickness: 1.5,
            height: 2,
          )
        ],
      ),
    );
