import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/controller/image_controller.dart';
import 'package:zinotalens/model/productlist_model.dart';
import 'package:zinotalens/provider/product_list_provider.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/error_widgets.dart';
import 'package:zinotalens/widgets/product_viewholder.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    Provider.of<ProductListProvider>(context, listen: false).getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductListProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isSearchIcon: true, title: "Eyeglasses"),
      body: productProvider.isDataLoad
          ? circularProgressIndicator()
          : productProvider.isError
              ? errorWidget(errorMsg: productProvider.errorMsg)
              : RefreshIndicator(
                  onRefresh: () => productProvider.getProductList(),
                  child: productProvider.productsLength == 0
                      ? errorWidget(errorMsg: "Empty!")
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemCount: productProvider.productsLength,
                          itemBuilder: ((context, index) {
                            Product products =
                                productProvider.productList[index];
                            return productViewHolder(context,
                                productId: products.productId!,
                                title: products.title!,
                                size: products.specifications!.size!,
                                rating: products.averageRating?.toDouble(),
                                photo: products.photos![0],
                                sellingPrice: products.salesPrice!,
                                listingPrice: products.listPrice);
                          }),
                        ),
                ),
    );
  }
}
