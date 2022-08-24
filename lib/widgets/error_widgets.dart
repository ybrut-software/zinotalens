import 'package:flutter/material.dart';
import 'package:zinotalens/utils/images.dart';

Widget noSearchResultWidget() => Center(
      child: Container(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 70, width: 70, child: Image.asset(search_icon)),
            SizedBox(height: 20),
            Text(
              "No results!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              "Please check the spelling or try a different search.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
