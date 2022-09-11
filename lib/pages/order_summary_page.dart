import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/model/product_addcart_model.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/widgets/cart_item_viewholder.dart';
import 'package:zinotalens/widgets/cart_page_widgets.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/order_detail_page_widget.dart';

import '../provider/product_cart_provider.dart';
import '../utils/colors.dart';

class OrderSummaryPage extends StatefulWidget {
  OrderSummaryPage({Key? key}) : super(key: key);

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductCartProvider>(context);
    final addressProvider = Provider.of<AddressProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isCartIcon: false, title: "Order Summary"),
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.only(bottom: 130),
          children: [
            shippingAddressComponent(
                isOrderSummaryView: true, addressProvider: addressProvider),
            SizedBox(height: 10),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ProductAddCartModel product = provider.cartItemList[index];
                  return cartItemViewHolder(
                      isOrderSummaryView: true,
                      index: index,
                      provider: provider,
                      product: product);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: provider.cartItemLength),
            SizedBox(height: 10),
            cartPriceDetails(totalPrice: provider.getTotalPrice),
          ],
        ),
        //button
        Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      "₹${provider.getTotalPrice}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.skyBlue),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent)),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
