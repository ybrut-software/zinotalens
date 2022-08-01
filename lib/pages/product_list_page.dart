import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/product_view_page.dart';
import 'package:zinotalens/pages/wishlist_page.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/product_viewholder.dart';

import '../utils/colors.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isSearchIcon: true, title: "Eyeglasses"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: 10,
        itemBuilder: ((context, index) => productViewHolder(context)),
      ),
    );
  }
}
