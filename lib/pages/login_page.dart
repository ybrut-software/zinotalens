import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/pages/home_page.dart';
import 'package:zinotalens/pages/otp_page.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/widgets/login_custom_clipper.dart';
import 'package:zinotalens/widgets/login_widgets.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customShape(icon: Icons.person),
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
                    controller: textController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.skyBlue,
                    minLines: 1,
                    maxLength: 10,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty)
                        return "please enter mobile no.";
                      else if (value.length < 10)
                        return "enter valid mobile no.";
                      else
                        return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        provider.setLoginProgress = true;
                        provider
                            .loginProvider(
                                contactNo: textController.text.trim())
                            .then((value) {
                          if (value)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpPage(textController.text)));
                        });
                      }
                    },
                    child: provider.getLoginProgress
                        ? buttonProgressIndicator()
                        : Text(
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
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent)),
                ),
                SizedBox(height: 250),
                loginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
