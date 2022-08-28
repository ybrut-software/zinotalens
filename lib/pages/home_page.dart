import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/category_items.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/image_slider.dart';
import 'package:zinotalens/widgets/navigation_drawer.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> sliderImages = [banner1, banner2, banner3, banner4, banner2];

  @override
  void initState() {
    initProviders();
    super.initState();
  }

  void initProviders() {
    Provider.of<ProductCartProvider>(context, listen: false).getCartItems();
    String token =
        Provider.of<AuthProvider>(context, listen: false).getAuthToken;
    Provider.of<AddressProvider>(context, listen: false)
        .getAddressListProvider(token: token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isSearchIcon: true),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawer: navigationDrawer(context),
      body: ListView(
        children: [
          SizedBox(height: 5),
          imageSliderView(sliderImages),
          SizedBox(height: 5),
          Container(
            height: 420,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.gray,
                    blurRadius: 0.5,
                    offset: Offset(0.5, 0.5))
              ],
            ),
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(labelColor: Colors.black, tabs: [
                    Tab(text: "MEN"),
                    Tab(text: "WOMEN"),
                    Tab(text: "KIDS"),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      categoryItems(itemCount: 10, context: context),
                      categoryItems(itemCount: 8, context: context),
                      categoryItems(itemCount: 5, context: context),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
