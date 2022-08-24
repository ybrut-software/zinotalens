import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/myaddress_page.dart';
import 'package:zinotalens/pages/myorder_page.dart';
import 'package:zinotalens/pages/notification_page.dart';
import 'package:zinotalens/pages/wishlist_page.dart';
import 'package:zinotalens/utils/images.dart';

import '../utils/colors.dart';

Widget navigationDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          drawerHeader(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrderPage()));
                      },
                      style: buttonStyle(),
                      icon: icon(Icons.shopping_bag_rounded),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "My Order",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      },
                      style: buttonStyle(),
                      icon: icon(Icons.notifications),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Notification",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishListPage()));
                      },
                      style: buttonStyle(),
                      icon: icon(Icons.favorite),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "WishList",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAddressPage()));
                      },
                      style: buttonStyle(),
                      icon: icon(Icons.domain),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "My Address",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      style: buttonStyle(),
                      icon: icon(Icons.assignment),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "My Prescriptions",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      style: buttonStyle(),
                      icon: icon(Icons.question_mark),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "FAQ",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      style: buttonStyle(),
                      icon: icon(Icons.contact_support_sharp),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Contact us",
                          style: textStyle(),
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      style: buttonStyle(),
                      icon: icon(Icons.info),
                      label: Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "About us",
                          style: textStyle(),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget drawerHeader() => DrawerHeader(
      decoration: BoxDecoration(color: Colors.skyBlue),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              profileViewHolder(),
              SizedBox(width: 16),
              Text(
                "Hi User",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );

Icon icon(IconData icon) => Icon(
      icon,
      color: Colors.black.withOpacity(0.7),
      size: 24,
    );

TextStyle textStyle() =>
    TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 14);

ButtonStyle buttonStyle() => ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
    alignment: Alignment.centerLeft,
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    overlayColor: MaterialStateProperty.all(Colors.gray.withOpacity(0.3)),
    backgroundColor: MaterialStateProperty.all(Colors.white));

Widget profileViewHolder() => Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(profilePlaceHolder)),
      ),
      // child: ClipOval(
      //   child: Image(image: AssetImage()),
      // ),
    );
