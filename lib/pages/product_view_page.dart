import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/controller/products_controller.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/product_viewpage_widgets.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';
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
    final productProvider = Provider.of<ProductDetailsProvider>(context);
    final product = productProvider.getProduct;
    final cart = Provider.of<ProductCartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: ""),
      body: productProvider.isDataLoad
          ? circularProgressIndicator()
          : Stack(
              children: [
                ListView(padding: EdgeInsets.only(bottom: 70), children: [
                  productViewPageWidget.ProductImageSliderAndDesc(
                      photo: frontFrame,
                      title: product.title!,
                      frameSize: product.specifications?.size,
                      frameWidth: product.specifications?.width,
                      rating: product.averageRating?.toDouble(),
                      stockQuantity: product.stockQuantity,
                      sellingPrice: product.salesPrice!,
                      listingPrice: product.listPrice),
                  SizedBox(height: 5),
                  productViewPageWidget.DeliveryOptionsView(warrantyTime: product.specifications?.warranty),
                  SizedBox(height: 5),
                  productViewPageWidget.AboutProduct(
                      description: product.description,
                      frameStyle: product.specifications?.frameStyle1,
                      productId: product.productId!),
                  SizedBox(height: 5),
                  productViewPageWidget.ProductSpecification(
                      specifications: product.specifications!)
                ]),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: ElevatedButton(
                      onPressed: () {},
                      // cart.addCartItemProvider(
                      //     productId: product.productId!,
                      //     price: product.price!.sellingPrice!),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.skyBlue),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
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
