import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:zinotalens/widgets/otp_input_widget.dart';

import '../utils/colors.dart';
import '../widgets/login_widgets.dart';

class OtpPage extends StatefulWidget {
  OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _field1 = TextEditingController();
  final TextEditingController _field2 = TextEditingController();
  final TextEditingController _field3 = TextEditingController();
  final TextEditingController _field4 = TextEditingController();
  final TextEditingController _field5 = TextEditingController();
  final TextEditingController _field6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customShape(icon: Icons.message),
              Text(
                "Enter OTP",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                "We have sent a OTP on your number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(height: 30),

              //otp text field
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OtpInputWidget(_field1, true),
                  OtpInputWidget(_field2, false),
                  OtpInputWidget(_field3, false),
                  OtpInputWidget(_field4, false),
                  OtpInputWidget(_field5, false),
                  OtpInputWidget(_field6, false),
                ],
              ),

              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: ElevatedButton(
                  onPressed: () {
                    String otp = _field1.text +
                        _field2.text +
                        _field3.text +
                        _field4.text +
                        _field5.text +
                        _field6.text;
                  },
                  child: Text(
                    "SUBMIT",
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
              SizedBox(height: 250),
              loginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
