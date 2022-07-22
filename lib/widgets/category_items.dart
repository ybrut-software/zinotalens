import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/product_list_page.dart';
import 'package:zinotalens/utils/images.dart';

import '../utils/colors.dart';

Widget categoryItems({required int itemCount, required BuildContext context}) =>
    Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        shrinkWrap: true,
        children: List.generate(itemCount, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProductListPage()),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.iconBackgroundColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(reading_eyeglasses_icon),
                  ),
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
