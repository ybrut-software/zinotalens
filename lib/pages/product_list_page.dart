import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/product_view_page.dart';
import 'package:zinotalens/pages/wishlist_page.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';

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
        itemBuilder: ((context, index) => Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductViewPage()),
                ),
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.gray.withOpacity(0.1)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.only(bottom: 10, top: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Icon(Icons.star, color: Colors.gray, size: 14),
                                SizedBox(width: 2),
                                Text("4.7",
                                    style: TextStyle(
                                        color: Colors.gray, fontSize: 12))
                              ]),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  splashRadius: 20,
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WishListPage())),
                                  icon: Icon(Icons.favorite_border,
                                      color: Colors.black, size: 20))
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 125,
                            width: double.infinity,
                            child: Image.asset(
                              sideFrame,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                        color: Colors.gray.withOpacity(0.3), thickness: 1.3),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Vincent Chase",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.gray.withOpacity(0.4)),
                                child: Text(
                                  "Extra Wide",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          RichText(
                            textScaleFactor: 1.1,
                            text: TextSpan(
                                text: "₹999  ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: "₹2999",
                                      style: TextStyle(
                                          color: Colors.gray,
                                          decoration:
                                              TextDecoration.lineThrough))
                                ]),
                          ),
                          // Text(
                          //   "₹999",
                          //   style: TextStyle(
                          //       fontSize: 16,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w700),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
