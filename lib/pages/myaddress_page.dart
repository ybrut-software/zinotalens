import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/pages/add_address_page.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/utils/style.dart';
import 'package:zinotalens/widgets/error_widgets.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';
import '../widgets/address_view_holder.dart';

class MyAddressPage extends StatefulWidget {
  MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  void initState() {
    Provider.of<AddressProvider>(context, listen: false).getAddressListProvider(
        token: Provider.of<AuthProvider>(context, listen: false).getAuthToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
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
            child: provider.IsFetchAddrLoader
                ? circularProgressIndicator()
                : provider.getAddressesLength == 0
                    ? errorWidget(errorMsg: "Empty!")
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: provider.getAddressesLength,
                        itemBuilder: (context, index) => addressViewHolder(
                            context,
                            index: index,
                            addressObj: provider.getAddresses[index])),
          ),
        ],
      ),
    );
  }
}
