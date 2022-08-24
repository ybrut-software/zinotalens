import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/database/database_helper.dart';
import 'package:zinotalens/model/search_list_model.dart';
import 'package:zinotalens/pages/login_page.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/provider/product_list_provider.dart';
import 'package:zinotalens/provider/product_search_provider.dart';
import 'package:zinotalens/utils/colors.dart';

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
          ListenableProvider(create: (context) => ProductCartProvider()),
          ListenableProvider(create: (context) => ProductSearchProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.light(primary: Colors.skyBlue)),
          title: "ZinotaLens",
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    ),
  );
}
