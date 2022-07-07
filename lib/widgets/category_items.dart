import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';

Widget categoryItems({required int itemCount}) => Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        shrinkWrap: true,
        children: List.generate(itemCount, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text("$index"),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Eyeglasses",
                style: TextStyle(fontSize: 10, color: Colors.black),
              )
            ],
          );
        }),
      ),
    );
