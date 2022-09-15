import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/model/order_list_model.dart';
import 'package:zinotalens/pages/order_details_page.dart';

import '../utils/colors.dart';

Widget OrderItemsViewholder(BuildContext context, Order orders) {
  List<Product> productList = orders.cart!.products!;
  return ElevatedButton(
    onPressed: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderDetailsPage())),
    style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.gray.withOpacity(0.1)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Text(
            "Order ID - ${orders.oid}",
            style: TextStyle(color: Colors.gray, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Text(
            "Items :",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        ListView.separated(
            padding: EdgeInsets.only(left: 30, right: 10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Product product = productList[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.title}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    maxLines: 2,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Qty ${product.quantity}",
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.gray.withOpacity(0.1),
                    thickness: 1,
                    height: 1,
                  ),
                ),
            itemCount: productList.length),
        SizedBox(height: 15),
        Divider(
          color: Colors.gray.withOpacity(0.3),
          thickness: 1.5,
          height: 2,
        )
      ],
    ),
  );
}
