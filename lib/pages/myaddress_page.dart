import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/add_address_page.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/values.dart';

import '../utils/colors.dart';
import '../widgets/address_view_holder.dart';

class MyAddressPage extends StatefulWidget {
  MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context,
          title: "My Addresses", isSearchIcon: false, isCartIcon: false),
      body: Column(
        children: [
          //add address button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: contentContainerDecoration(),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddDeliveryAddressPage()));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.skyBlue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add a new address",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.skyBlue),
                  )
                ],
              ),
            ),
          ),

          //address view holder
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: 3,
                itemBuilder: (context, index) => addressViewHolder()),
          ),
        ],
      ),
    );
  }
}
