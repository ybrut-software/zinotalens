import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/utils/colors.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';

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
                    textFieldDecoration(labelText: "Full Name (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    textFieldDecoration(labelText: "Phone number (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: textFieldDecoration(
                    labelText: "Alternate Phone number (Optional)"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    textFieldDecoration(labelText: "Pincode (Required)*"),
              ),
              SizedBox(height: 20),
              //state and city
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        textFieldDecoration(labelText: "State (Required)*"),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        textFieldDecoration(labelText: "City (Required)*"),
                  ))
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: textFieldDecoration(
                    labelText: "House No., Building Name (Required)*"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: textFieldDecoration(
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

  InputDecoration textFieldDecoration({String? labelText}) => InputDecoration(
        labelText: "$labelText",
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(width: 1.0, color: Colors.skyBlue)),
      );
}
