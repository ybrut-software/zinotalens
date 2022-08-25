import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/main.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/cart_item_viewholder.dart';
import 'package:zinotalens/widgets/cart_page_widgets.dart';
import 'package:zinotalens/widgets/error_widgets.dart';

import '../utils/colors.dart';

class CartViewPage extends StatefulWidget {
  CartViewPage({Key? key}) : super(key: key);

  @override
  State<CartViewPage> createState() => _CartViewPageState();
}

class _CartViewPageState extends State<CartViewPage> {
  @override
  void initState() {
    Provider.of<ProductCartProvider>(context, listen: false).getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductCartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        title: Text("Cart", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          provider.cartItemLength == 0
              ? emptyCartWidget()
              : ListView(
                  padding: EdgeInsets.only(top: 5, bottom: 130),
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.cartItemLength,
                      itemBuilder: (context, index) {
                        ProductAddCartModel product =
                            provider.cartItemList[index];
                        return cartItemViewHolder(
                            index: index,
                            provider: provider,
                            productId: product.productId!,
                            title: product.productTitle!,
                            photo: sideFrame,
                            listingPrice: product.productListingPrice,
                            salesPrice: product.productSellingPrice!,
                            quantity: product.productQuantity);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                    ),
                    SizedBox(height: 10),
                    cartPriceDetails(totalPrice: provider.getTotalPrice),
                  ],
                ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total (incl. GST)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text("₹${provider.getTotalPrice}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            provider.clearCartDataProvider();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.skyBlue),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(18),
                            child: Text(
                              "SELECT ADDRESS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
