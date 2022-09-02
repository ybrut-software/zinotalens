import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/utils/style.dart';

import '../utils/colors.dart';

Widget cartPriceDetails({int? totalPrice}) => Container(
      padding: EdgeInsets.all(10),
      decoration: contentContainerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Text("Price Details", style: TextStyle(fontSize: 16)),
          ),
          Divider(thickness: 1, color: Colors.gray.withOpacity(0.2)),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price"),
                      Text("₹$totalPrice", style: TextStyle(color: Colors.gray))
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tax"),
                      Text("+ ₹199", style: TextStyle(color: Colors.gray))
                    ]),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Convenience Fees"),
                      Text("FREE", style: TextStyle(color: Colors.gray))
                    ])
              ],
            ),
          )
        ],
      ),
    );

Widget selectedAddressWidget(BuildContext context, Address address) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: contentContainerDecoration(),
    child: Row(
      children: [
        Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child: Text(
                          "Deliver to: ${address.fullName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          ", ${address.postalCode}",
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "${address.streetAddress1}, ${address.streetAddress2}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.gray),
                )
              ],
            )),
        SizedBox(width: 5),
        Expanded(
            flex: 3,
            child: ElevatedButton(
                onPressed: () {
                  showBottomSlider(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor:
                        MaterialStateProperty.all(Colors.gray.withOpacity(0.2)),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.gray.withOpacity(0.5), width: 1.5)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)))),
                child: Text(
                  "Change",
                  style: TextStyle(color: Colors.skyBlue),
                )))
      ],
    ),
  );
}

void showBottomSlider(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        final provider = Provider.of<AddressProvider>(context);
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.5,
          maxChildSize: 1,
          expand: false,
          builder: (context, scrollController) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  )),
              title: Text(
                "Select Delivery Address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            body: ListView.separated(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  Address address = provider.getAddresses[index];
                  print(address.selected);
                  return ListTile(
                    onTap: () => provider.changeSelectedAddr(address, index),
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${address.fullName}, ${address.postalCode}",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${address.streetAddress1}, ${address.streetAddress2}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.gray),
                        )
                      ],
                    ),
                    leading: Radio(
                        value: true,
                        groupValue: address.selected,
                        onChanged: (value) {}),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: provider.getAddressesLength),
          ),
        );
      });
}
