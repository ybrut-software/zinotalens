import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';
import '../utils/images.dart';

Widget wishlistItemViewHolder() => Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
      ]),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Image(image: AssetImage(sideFrame), fit: BoxFit.cover)),
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Stack(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Zinotalens Air"),
                          SizedBox(height: 4),
                          RichText(
                            textScaleFactor: 1.1,
                            text: TextSpan(
                                text: "₹999  ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: "₹2999",
                                      style: TextStyle(
                                          color: Colors.gray,
                                          decoration:
                                              TextDecoration.lineThrough))
                                ]),
                          )
                        ]),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Icon(Icons.delete, size: 22, color: Colors.gray),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
