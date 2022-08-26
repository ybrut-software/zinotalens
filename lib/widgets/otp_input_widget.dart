import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';

import '../utils/colors.dart';

class OtpInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  const OtpInputWidget(this.controller, this.autofocus, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 40,
        child: TextField(
          maxLines: 1,
          autofocus: autofocus,
          controller: controller,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (value.length == 1) FocusScope.of(context).nextFocus();
          },
          decoration: InputDecoration(
              counterText: "",
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(color: Colors.skyBlue))),
        ),
      ),
    );
  }
}
