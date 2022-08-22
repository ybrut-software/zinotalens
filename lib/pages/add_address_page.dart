import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/colors.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';

import '../widgets/values.dart';

class AddDeliveryAddressPage extends StatefulWidget {
  AddDeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddressPage> createState() => _AddDeliveryAddressPageState();
}

class _AddDeliveryAddressPageState extends State<AddDeliveryAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
          title: "Add delivery address",
          leadingIconClose: true,
          isCartIcon: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration:
                    textFormFieldDecoration(labelText: "Full Name (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: textFormFieldDecoration(
                    labelText: "Phone number (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: textFormFieldDecoration(
                    labelText: "Alternate Phone number (Optional)"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    textFormFieldDecoration(labelText: "Pincode (Required)*"),
              ),
              SizedBox(height: 20),
              //state and city
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        textFormFieldDecoration(labelText: "State (Required)*"),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        textFormFieldDecoration(labelText: "City (Required)*"),
                  ))
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: textFormFieldDecoration(
                    labelText: "House No., Building Name (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: textFormFieldDecoration(
                    labelText: "Road name, Area, Colony (Required)*"),
              ),
              SizedBox(height: 40),
              //save button
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: Text(
                      "Save Address",
                      style: TextStyle(fontSize: 16),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
