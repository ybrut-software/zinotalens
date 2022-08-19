import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/pages/cart_view_page.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';

import '../utils/colors.dart';

AppBar customAppBar(BuildContext context,
        {String title = "ZinotaLens",
        bool isSearchIcon = false,
        bool leadingIconClose = false,
        bool isCartIcon = true}) =>
    AppBar(
      backgroundColor: Colors.skyBlue,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: leadingIconClose
          ? IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close))
          : null,
      actions: [
        isSearchIcon
            ? IconButton(
                onPressed: () {
                  //delete cart data just for testing purpose
                  databaseHelper.clearCart();
                },
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
                  badgeContent: Text(
                    "${Provider.of<ProductCartProvider>(context).cartItemList.length}",
                    style: TextStyle(fontSize: 10),
                  ),
                  animationType: BadgeAnimationType.scale,
                  child: Icon(Icons.shopping_cart),
                ),
                splashRadius: 20,
              )
            : SizedBox(),
        SizedBox(width: 10)
      ],
    );
