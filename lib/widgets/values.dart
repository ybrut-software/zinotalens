import 'package:flutter/material.dart' hide Colors;

import '../utils/colors.dart';

BoxDecoration contentContainerDecoration() =>
    BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
    ]);

TextStyle addressTextStyle() =>
    TextStyle(fontSize: 14, color: Colors.black, height: 1.4);
