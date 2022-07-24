import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/pages/home_page.dart';
import 'package:zinotalens/widgets/login_custom_clipper.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 230,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: LoginCustomClipper(),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.iconBackgroundColor),
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
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: Center(
                            child: Icon(Icons.person,
                                color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Your Mobile Number",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.skyBlue,
                  decoration: InputDecoration(
                    labelText: "Enter mobile number",
                    labelStyle: TextStyle(color: Colors.skyBlue),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.skyBlue),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.skyBlue),
                        borderRadius: BorderRadius.circular(5)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.skyBlue),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.skyBlue),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent)),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Text(
                  "Skip >>",
                  style: TextStyle(color: Colors.skyBlue),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.iconBackgroundColor.withOpacity(0.5)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent)),
              ),
              SizedBox(height: 250),
              Text(
                "© Zinota software PVT. LTD",
                style: TextStyle(fontSize: 12, color: Colors.gray),
              )
            ],
          ),
        ),
      ),
    );
  }
}
