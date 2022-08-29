import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/pages/update_address_page.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/utils/style.dart';

Widget addressViewHolder(BuildContext context,
        {required int index, required Address addressObj}) =>
    Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 16),
      decoration: contentContainerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: _buildPopupMenu(context, index, addressObj.id!),
          ),
          Text(
            addressObj.fullName!,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            "${addressObj.streetAddress1}, ${addressObj.streetAddress2}",
            style: addressTextStyle(),
          ),
          Text(
            "${addressObj.city}, ${addressObj.state}, ${addressObj.country} - ${addressObj.postalCode}",
            style: addressTextStyle(),
          ),
          SizedBox(height: 10),
          Text(
            addressObj.contact.toString(),
            style: addressTextStyle(),
          )
        ],
      ),
    );

_buildPopupMenu(BuildContext context, int index, String addressId) {
  final provider = Provider.of<AddressProvider>(context);
  final token = Provider.of<AuthProvider>(context).getAuthToken;
  return Container(
    height: 20,
    width: 14,
    child: PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_vert),
      splashRadius: 10,
      iconSize: 16,
      onSelected: (value) {
        if (value == 0)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdateDeliveryAddressPage(addressId)));
      },
      itemBuilder: (context) => [
        PopupMenuItem(
            child: Text("Edit"),
            value: 0,
            height: 30,
            textStyle: TextStyle(fontSize: 12, color: Colors.black)),
        PopupMenuItem(
            child: Text("Remove"),
            onTap: () => provider.deleteAddressProvider(context,
                token: token, addressId: addressId, index: index),
            height: 30,
            textStyle: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    ),
  );
}
