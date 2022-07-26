import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';

import '../utils/colors.dart';

class OrderDetailsPage extends StatefulWidget {
  OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Order Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            splashRadius: 20,
          ),
        ],
      ),
      body: ListView(padding: EdgeInsets.only(top: 3, bottom: 20), children: [
        //order tracking section
        Container(
          decoration: contentContainerDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Text(
                  "Order ID - OD14523698723652596",
                  style: TextStyle(color: Colors.gray, fontSize: 12),
                ),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            frontFrame,
                            fit: BoxFit.cover,
                          ))),
                  SizedBox(width: 5),
                  Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vincent Chase Gold Green Full Rim Rounded",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Seller: Zinota Remedies",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.gray, fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "₹999",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ))
                ]),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.gray.withOpacity(0.2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent)),
                      ),
                    )),
                    VerticalDivider(
                      color: Colors.gray.withOpacity(0.5),
                      width: 2,
                    ),
                    Expanded(
                        child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Need help?",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.gray.withOpacity(0.2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent)),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),

        //download invoice button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          decoration: contentContainerDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.insert_drive_file,
                    color: Colors.skyBlue,
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Invoice Download",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Icon(Icons.chevron_right, color: Colors.black)
            ],
          ),
        ),

        SizedBox(height: 10),

        //shipping details section
        Container(
          decoration: contentContainerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Text(
                  "Shipping Details",
                  style: TextStyle(color: Colors.gray, fontSize: 12),
                ),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Roshan Nahak",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "SC-MQ, QN-157, tulsi mandir odiya daffai, Government Girls Higher Secondary School, Dumanhill",
                      style: addressTextStyle(),
                    ),
                    Text("Chirimiri", style: addressTextStyle()),
                    Text("Chhattisgarh - 497557", style: addressTextStyle()),
                    Text("Phone number: 1234567891", style: addressTextStyle())
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),

        //pricing details section
        Container(
          decoration: contentContainerDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Text(
                  "Price Details",
                  style: TextStyle(color: Colors.gray, fontSize: 12),
                ),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("List Price"),
                        Text("₹2999",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Selling Price"),
                        Text("₹999"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping fee"),
                        Text("₹40"),
                      ],
                    )
                  ],
                ),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount"),
                    Text("₹1039"),
                  ],
                ),
              ),
              Divider(color: Colors.gray.withOpacity(0.5), height: 2),
            ],
          ),
        )
      ]),
    );
  }

  TextStyle addressTextStyle() =>
      TextStyle(fontSize: 14, color: Colors.black, height: 1.4);

  BoxDecoration contentContainerDecoration() =>
      BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.gray, offset: Offset(0, 1), blurRadius: 2)
      ]);
}
