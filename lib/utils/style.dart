import 'package:flutter/material.dart' hide Colors;

import 'colors.dart';

BoxDecoration contentContainerDecoration() =>
    BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
    ]);

TextStyle addressTextStyle() =>
    TextStyle(fontSize: 14, color: Colors.black, height: 1.4);

InputDecoration textFormFieldDecoration({String? labelText}) => InputDecoration(
      labelText: "$labelText",
      isDense: true,
      counterText: "",
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(width: 0.5)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(width: 1.0, color: Colors.skyBlue)),
    );
