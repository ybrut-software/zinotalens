import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/pages/cart_view_page.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/product_viewpage_widgets.dart';

import '../model/productlist_model.dart';
import '../utils/colors.dart';

class ProductViewPage extends StatefulWidget {
  ProductViewPage({Key? key, required this.productId}) : super(key: key);

  final productId;

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  @override
  void initState() {
    Provider.of<ProductDetailsProvider>(context, listen: false)
        .getProductDetail(productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductViewPageWidget productViewPageWidget =
        ProductViewPageWidget(context);
    final product = Provider.of<ProductDetailsProvider>(context).product;
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: ""),
      body: Stack(
        children: [
          ListView(padding: EdgeInsets.only(bottom: 70), children: [
            productViewPageWidget.ProductImageSliderAndDesc(
                photo: product.photo!,
                title: product.title!,
                rating: product.rating,
                stockQuantity: product.stockQuantity,
                sellingPrice: product.price!.sellingPrice!.toInt(),
                listingPrice: product.price?.listingPrice?.toInt()),
            SizedBox(height: 5),
            productViewPageWidget.DeliveryOptionsView(),
            SizedBox(height: 5),
            productViewPageWidget.AboutProduct(
                description: product.description,
                productId: product.productId!),
            SizedBox(height: 5),
            productViewPageWidget.ProductSpecification()
          ]),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.skyBlue),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
