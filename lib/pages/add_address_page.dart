import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/utils/colors.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/style.dart';

class AddDeliveryAddressPage extends StatefulWidget {
  AddDeliveryAddressPage({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddressPage> createState() => _AddDeliveryAddressPageState();
}

class _AddDeliveryAddressPageState extends State<AddDeliveryAddressPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contact1Controller = TextEditingController();
  TextEditingController contact2Controller = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final token = Provider.of<AuthProvider>(context).getAuthToken;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
          title: "Add delivery address",
          leadingIconClose: true,
          isCartIcon: false),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: fullNameController,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  decoration: textFormFieldDecoration(
                      labelText: "Full Name (Required)*"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: contact1Controller,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  maxLength: 10,
                  decoration: textFormFieldDecoration(
                      labelText: "Phone number (Required)*"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: contact2Controller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  decoration: textFormFieldDecoration(
                      labelText: "Alternate Phone number (Optional)"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  decoration:
                      textFormFieldDecoration(labelText: "Pincode (Required)*"),
                ),
                SizedBox(height: 20),
                //country
                TextFormField(
                  controller: countryController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  decoration:
                      textFormFieldDecoration(labelText: "Country (Required)*"),
                ),
                SizedBox(height: 20),
                //state and city
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: stateController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) return "required";
                        return null;
                      },
                      decoration: textFormFieldDecoration(
                          labelText: "State (Required)*"),
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextFormField(
                      controller: cityController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) return "required";
                        return null;
                      },
                      decoration: textFormFieldDecoration(
                          labelText: "City (Required)*"),
                    ))
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: address1Controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  decoration: textFormFieldDecoration(
                      labelText: "House No., Building Name (Required)*"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: address2Controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) return "required";
                    return null;
                  },
                  decoration: textFormFieldDecoration(
                      labelText: "Road name, Area, Colony (Required)*"),
                ),
                SizedBox(height: 40),
                //save button
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          addressProvider.setSaveAddrLoader = true;

                          var uniqueId =
                              Uuid().v1().replaceAll("-", "").substring(0, 24);
                          Address address = Address(
                              id: uniqueId,
                              fullName: fullNameController.text,
                              contact: int.parse(contact1Controller.text),
                              postalCode: pincodeController.text,
                              country: countryController.text,
                              state: stateController.text,
                              city: cityController.text,
                              streetAddress1: address1Controller.text,
                              streetAddress2: address2Controller.text);
                          addressProvider.saveAddressProvider(context,
                              token: token, addressObj: address);
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      child: addressProvider.isSaveAddrLoader
                          ? buttonProgressIndicator()
                          : Text(
                              "Save Address",
                              style: TextStyle(fontSize: 16),
                            )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
