import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/model/search_list_model.dart';
import 'package:zinotalens/provider/product_search_provider.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/error_widgets.dart';
import 'package:zinotalens/widgets/product_viewholder.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductSearchProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        provider.clearSearchList();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.skyBlue,
          leadingWidth: 35,
          shadowColor: Colors.transparent,
          title: TextFormField(
            cursorColor: Colors.skyBlue,
            keyboardType: TextInputType.text,
            autofocus: true,
            onChanged: (string) {
              provider.setIsDataLoad = true;
              provider.searchProductsResult(string.trim());
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.gray,
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 40),
              isDense: true,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(3)),
            ),
          ),
        ),
        body: provider.isDataLoad
            ? circularProgressIndicator()
            : provider.productsLength == 0
                ? noSearchResultWidget()
                : ListView.builder(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 20),
                    itemCount: provider.productsLength,
                    itemBuilder: (context, index) {
                      Product product = provider.products[index];
                      return productViewHolder(context,
                          productId: "productId",
                          title: product.title!,
                          photo: sideFrame,
                          sellingPrice: product.salesPrice!,
                          rating: product.averageRating?.toDouble(),
                          listingPrice: product.listPrice);
                    }),
      ),
    );
  }
}
