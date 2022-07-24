import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';
import 'package:zinotalens/widgets/category_items.dart';
import 'package:zinotalens/widgets/image_slider.dart';
import 'package:zinotalens/widgets/nevigation_drawer.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> sliderImages = [banner1, banner2, banner3, banner4, banner2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.skyBlue,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "ZinotaLens",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            splashRadius: 20,
          ),
        ],
      ),
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
