import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/cart_view_page.dart';

import '../utils/colors.dart';

AppBar customAppBar(BuildContext context,
        {String title = "ZinotaLens",
        bool isSearchIcon = false,
        bool isCartIcon = true}) =>
    AppBar(
      backgroundColor: Colors.skyBlue,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        isSearchIcon
            ? IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                splashRadius: 20,
              )
            : SizedBox(),
        isCartIcon
            ? IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartViewPage())),
                icon: Badge(
                  badgeColor: Colors.iconBackgroundColor,
                  badgeContent: Text("0"),
                  animationType: BadgeAnimationType.scale,
                  child: Icon(Icons.shopping_cart),
                ),
                splashRadius: 20,
              )
            : SizedBox(),
        SizedBox(width: 10)
      ],
    );
