import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/database/database_helper.dart';
import 'package:zinotalens/pages/splash_screen.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/provider/order_provider.dart';
import 'package:zinotalens/provider/payment_provider.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/provider/product_details_provider.dart';
import 'package:zinotalens/provider/product_list_provider.dart';
import 'package:zinotalens/provider/product_search_provider.dart';
import 'package:zinotalens/utils/colors.dart';

//init local database
DatabaseHelper databaseHelper = DatabaseHelper();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context, widget) => MultiProvider(
        providers: [
          ListenableProvider(create: (context) => ProductListProvider()),
          ListenableProvider(create: (context) => ProductDetailsProvider()),
          ListenableProvider(create: (context) => ProductCartProvider()),
          ListenableProvider(create: (context) => ProductSearchProvider()),
          ListenableProvider(create: (context) => AuthProvider()),
          ListenableProvider(create: (context) => AddressProvider()),
          ListenableProvider(create: (context) => PaymentProvider()),
          ListenableProvider(create: (context) => OrderProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.light(primary: Colors.skyBlue)),
          title: "ZinotaLens",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    ),
  );
}
