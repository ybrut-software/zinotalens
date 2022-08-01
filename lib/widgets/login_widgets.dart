import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';
import 'login_custom_clipper.dart';

Widget customShape() => Container(
      height: 230,
      child: Stack(
        children: [
          ClipPath(
            clipper: LoginCustomClipper(),
            child: Container(
              decoration: BoxDecoration(color: Colors.iconBackgroundColor),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: ClipOval(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.skyBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5)),
                child: Center(
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget loginFooter() => Container(
      child: Text(
        "© Zinota software PVT. LTD",
        style: TextStyle(fontSize: 12, color: Colors.gray),
      ),
    );
