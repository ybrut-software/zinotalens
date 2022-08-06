import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/pages/login_page.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/provider/product_list_provider.dart';

void main() => runApp(
      ScreenUtilInit(
        designSize: Size(360, 780),
        builder: (context, widget) => MultiProvider(
          providers: [
            ListenableProvider(
                create: (context) => ProductListProvider(context)),
            ListenableProvider(
                create: (context) => ProductDetailsProvider(context))
          ],
          child: MaterialApp(
            title: "ZinotaLens",
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          ),
        ),
      ),
    );
