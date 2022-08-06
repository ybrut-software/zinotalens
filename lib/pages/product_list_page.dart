import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/model/productlist_model.dart';
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
  List<ProductListModel> productList = [];
  @override
  void initState() {
    fetchProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isSearchIcon: true, title: "Eyeglasses"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: productList.length,
        itemBuilder: ((context, index) {
          ProductListModel products = productList[index];
          return productViewHolder(context,
              productId: products.productId!,
              title: products.title!,
              rating: products.rating,
              photo: products.photo!,
              sellingPrice: products.price!.sellingPrice!.toInt(),
              listingPrice: products.price?.listingPrice?.toInt());
        }),
      ),
    );
  }

  void fetchProductList() async {
    var rawJson = await DefaultAssetBundle.of(context)
        .loadString('lib/json/products.json');
    setState(() {
      productList = productListModelFromJson(rawJson);
    });
  }
}
