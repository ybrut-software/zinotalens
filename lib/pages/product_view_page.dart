import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/cart_view_page.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/product_viewpage_widgets.dart';

import '../utils/colors.dart';

class ProductViewPage extends StatefulWidget {
  ProductViewPage({Key? key}) : super(key: key);

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        // title: Text(
        //   "Eyeglasses",
        //   style: TextStyle(color: Colors.white),
        // ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.search),
          //   splashRadius: 20,
          // ),
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CartViewPage())),
            icon: Icon(Icons.shopping_cart),
            splashRadius: 20,
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(padding: EdgeInsets.only(bottom: 70), children: [
            ProductImageSliderAndDesc(),
            SizedBox(height: 5),
            DeliveryOptionsView(),
            SizedBox(height: 5),
            AboutProduct(),
            SizedBox(height: 5),
            ProductSpecification()
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
          )
        ],
      ),
    );
  }
}
