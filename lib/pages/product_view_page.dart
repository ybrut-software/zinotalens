import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';

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
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.search),
        //     splashRadius: 20,
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.shopping_cart),
        //     splashRadius: 20,
        //   ),
        // ],
      ),
      body: ListView(
        children: [
          //product image slider and description
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
            ]),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: 340,
                child: Image.asset(
                  frontFrame,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(thickness: 1.2, color: Colors.gray.withOpacity(0.1)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Vincent Chase",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Black Full Rim Rectangle",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Frame Width: 138mm",
                      style: TextStyle(fontSize: 14, color: Colors.gray),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Frame Size: Medium",
                      style: TextStyle(fontSize: 14, color: Colors.gray),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      textScaleFactor: 1.1,
                      text: TextSpan(
                          text: "₹999  ",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: "₹2999",
                                style: TextStyle(
                                    color: Colors.gray,
                                    decoration: TextDecoration.lineThrough))
                          ]),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(height: 5),
          //check delivery section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
            ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Check Delivery Options",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(height: 15),
                //check pincode textfield
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.gray,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5))
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Check Pincode",
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.gray,
                                size: 25,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "CHANGE",
                            style: TextStyle(
                                color: Colors.skyBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.gray.withOpacity(0.2)),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.gray.withOpacity(0.3),
                                width: 1.5)),
                        child: Icon(Icons.home, color: Colors.gray),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Home Delivery",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Get your frame delivered at your doorsteps",
                            style: TextStyle(
                                color: Colors.gray,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
