import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';
import '../utils/images.dart';

Widget CartItemViewHolder() => Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 90,
                color: Colors.gray,
                child: Image(image: AssetImage(sideFrame), fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                flex: 6,
                child: Container(
                  height: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ZinotaLens Air Eyeglasses"),
                      Text("+ Anti-Fog Zero Power",
                          style: TextStyle(color: Colors.gray)),
                    ],
                  ),
                )),
          ]),
          Divider(thickness: 1, color: Colors.gray.withOpacity(0.2)),
          SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Regular Price"),
            Text(
              "₹2999",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.gray,
                  fontWeight: FontWeight.w500),
            )
          ]),
          SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Special Price",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "₹999",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )
          ]),
          SizedBox(height: 5),
          Divider(thickness: 1, color: Colors.gray.withOpacity(0.2)),
          Row(
            children: [
              Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black.withOpacity(0.7),
                        size: 22,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "WISHLIST",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        size: 30,
                        color: Colors.skyBlue,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: Colors.skyBlue,
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
