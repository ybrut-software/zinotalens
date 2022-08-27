import 'dart:async';

import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/pages/home_page.dart';
import 'package:zinotalens/pages/login_page.dart';
import 'package:zinotalens/provider/auth_provider.dart';

import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).getAuthTokenProvider();
    splashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            "Zinotalens",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30),
          ),
        ),
      ),
    ));
  }

  splashScreenTimer() {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  provider.getAuthToken.isEmpty ? LoginPage() : HomePage()),
          (route) => false);
    });
  }
}
