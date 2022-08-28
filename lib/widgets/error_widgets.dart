import 'package:flutter/material.dart';
import 'package:zinotalens/utils/images.dart';

Widget noSearchResultWidget() => Center(
      child: Container(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 70, width: 70, child: Image.asset(search_icon)),
            SizedBox(height: 20),
            Text(
              "No results!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              "Please check the spelling or try a different search.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );

Widget errorWidget({required String errorMsg}) => Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 100, width: 100, child: Image.asset(error_icon)),
        SizedBox(height: 10),
        Text(
          errorMsg,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    ));

Widget emptyCartWidget() => Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 100, width: 100, child: Image.asset(empty_cart_icon)),
        SizedBox(height: 10),
        Text(
          "Your cart is empty!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        Text(
          "Add item to it now",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    ));

showSnackBarMessage(BuildContext context, String msg) {
  final snackBar = SnackBar(content: Text(msg));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
