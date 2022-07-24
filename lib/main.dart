import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zinotalens/pages/login_page.dart';

void main() => runApp(ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context, widget) => MaterialApp(
        title: "ZinotaLens",
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ),);
