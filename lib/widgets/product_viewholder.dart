import 'package:flutter/material.dart' hide Colors;

import '../controller/image_controller.dart';
import '../pages/product_view_page.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

Widget productViewHolder(BuildContext context,
        {required String productId,
        required String title,
        double? rating,
        int? listingPrice,
        required String size,
        required String photo,
        required int sellingPrice}) =>
    Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductViewPage(productId: productId)),
        ),
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.gray.withOpacity(0.1)),
            padding:
                MaterialStateProperty.all(EdgeInsets.only(bottom: 10, top: 10)),
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
                        Text("$rating",
                            style: TextStyle(color: Colors.gray, fontSize: 12))
                      ]),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          splashRadius: 20,
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border,
                              color: Colors.black, size: 20))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 125,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            scale: 1.5, image: AssetImage(image_placeholder))),
                    child: Image.network(
                      fetchImageController(photoUrl: photo),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Divider(color: Colors.gray.withOpacity(0.3), thickness: 1.3),
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
                      Expanded(
                        child: Text(
                          "$title",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration:
                            BoxDecoration(color: Colors.gray.withOpacity(0.4)),
                        child: Text(
                          "$size",
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
                        text: "₹$sellingPrice  ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: "₹$listingPrice",
                              style: TextStyle(
                                  color: Colors.gray,
                                  decoration: TextDecoration.lineThrough))
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
