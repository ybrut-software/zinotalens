import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/model/shipment_model.dart';
import 'package:zinotalens/utils/style.dart';
import 'package:zinotalens/widgets/step_tracker.dart';

import '../model/order_list_model.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

Widget orderTrakingComponent(
        {required Order order, required Shipment shipment}) =>
    Container(
      decoration: contentContainerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Text(
              "Order ID - ${order.oid}",
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

          //tracker
          Container(
            //height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(color: Colors.white),
            child: StepTracker(dotSize: 10, steps: [
              Steps(
                  title: Text("Order placed"),
                  state: shipment.orderPlaced!
                      ? TrackerState.complete
                      : TrackerState.none),
              Steps(
                  title: Text("Order shipped"),
                  state: shipment.orderShipped!
                      ? TrackerState.complete
                      : shipment.orderCancelled!
                          ? TrackerState.disabled
                          : TrackerState.none),
              Steps(
                  title: Text("Out for delivery"),
                  state: shipment.outForDelivery!
                      ? TrackerState.complete
                      : shipment.orderCancelled!
                          ? TrackerState.disabled
                          : TrackerState.none),
              Steps(
                  title: Text("Delivered"),
                  state: shipment.orderDelivered!
                      ? TrackerState.complete
                      : shipment.orderCancelled!
                          ? TrackerState.disabled
                          : TrackerState.none),
            ]),
          ),

          Divider(color: Colors.gray.withOpacity(0.5), height: 2),
          orderActionButtons()
        ],
      ),
    );

Widget downloadInvoiceButton() => Container(
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
    );

Widget shippingAddressComponent(
    {bool isOrderSummaryView = false, required Address address}) {
  return Container(
    decoration: contentContainerDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isOrderSummaryView
            ? Padding(
                padding: EdgeInsets.only(left: 14, right: 14, top: 20),
                child: Text(
                  "Deliver to:",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              )
            : Column(
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
                ],
              ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${address.fullName}",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "${address.streetAddress1}, ${address.streetAddress2}",
                style: addressTextStyle(),
              ),
              Text("${address.city}", style: addressTextStyle()),
              Text("${address.state} - ${address.postalCode}",
                  style: addressTextStyle()),
              Text("Phone number: ${address.contact}",
                  style: addressTextStyle())
            ],
          ),
        )
      ],
    ),
  );
}

Widget orderPricingDetails() => Container(
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
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough)),
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
    );

Widget orderActionButtons() => Container(
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
                  overlayColor:
                      MaterialStateProperty.all(Colors.gray.withOpacity(0.2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
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
                  overlayColor:
                      MaterialStateProperty.all(Colors.gray.withOpacity(0.2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
            ),
          ))
        ],
      ),
    );
