import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';

import '../utils/colors.dart';

class WishListPage extends StatefulWidget {
  WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.skyBlue,
          shadowColor: Colors.transparent,
          title: Text("Wishlist")),
      body: ListView(padding: EdgeInsets.only(top: 5, bottom: 20), children: [
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
          ]),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child:
                      Image(image: AssetImage(sideFrame), fit: BoxFit.cover)),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
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
                                        decoration: TextDecoration.lineThrough))
                              ]),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
