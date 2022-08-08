import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/database/database_helper.dart';
import 'package:zinotalens/pages/login_page.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/provider/product_list_provider.dart';

//init local database
DatabaseHelper databaseHelper = DatabaseHelper();

void main() {
  return runApp(
    ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context, widget) => MultiProvider(
        providers: [
          ListenableProvider(create: (context) => ProductListProvider(context)),
          ListenableProvider(
              create: (context) => ProductDetailsProvider(context)),
          ListenableProvider(create: (context) => ProductCartProvider())
        ],
        child: MaterialApp(
          title: "ZinotaLens",
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    ),
  );
}
