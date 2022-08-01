import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/wishlist_item_viewholder.dart';

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
      appBar: customAppBar(context, title: "Wishlist", isCartIcon: false),
      body: ListView(
          padding: EdgeInsets.only(top: 5, bottom: 20),
          children: [wishlistItemViewHolder()]),
    );
  }
}
