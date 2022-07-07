import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/images.dart';

import '../utils/colors.dart';

Widget navigationDrawer() => Drawer(
      child: ListView(
        children: [
          drawerHeader(),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              "My order",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              "My order",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              "My order",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(
              "My order",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
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

Widget profileViewHolder() => Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(profilePlaceHolder)),
      ),
      child: ClipOval(
        child: Image(image: AssetImage(roshan)),
      ),
    );
