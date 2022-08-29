import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/model/single_address_model.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/utils/colors.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../utils/style.dart';

class UpdateDeliveryAddressPage extends StatefulWidget {
  final addressId;
  UpdateDeliveryAddressPage(this.addressId, {Key? key}) : super(key: key);

  @override
  State<UpdateDeliveryAddressPage> createState() =>
      _UpdateDeliveryAddressPageState();
}

class _UpdateDeliveryAddressPageState extends State<UpdateDeliveryAddressPage> {
  final formKey = GlobalKey<FormState>();

  String fullName = "";
  String contact1 = "";
  String contact2 = "";
  String pinCode = "";
  String country = "";
  String state = "";
  String city = "";
  String address1 = "";
  String address2 = "";

  @override
  void initState() {
    Provider.of<AddressProvider>(context, listen: false)
        .fetchSingleAddressProvider(
            token:
                Provider.of<AuthProvider>(context, listen: false).getAuthToken,
            addressId: widget.addressId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final token = Provider.of<AuthProvider>(context).getAuthToken;
    SingleAddress address = addressProvider.singleAddress;

    if (address.id == widget.addressId) {
      fullName = address.fullName!;
      contact1 = address.contact.toString();
      pinCode = address.postalCode!;
      country = address.country!;
      state = address.state!;
      city = address.city!;
      address1 = address.streetAddress1!;
      address2 = address.streetAddress2!;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
          title: "Update address", leadingIconClose: true, isCartIcon: false),
      body: addressProvider.isSingleAddrLoader
          ? circularProgressIndicator()
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(text: fullName),
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        decoration: textFormFieldDecoration(
                            labelText: "Full Name (Required)*"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: TextEditingController(text: contact1),
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
                        controller: TextEditingController(text: contact2),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: textFormFieldDecoration(
                            labelText: "Alternate Phone number (Optional)"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: TextEditingController(text: pinCode),
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        decoration: textFormFieldDecoration(
                            labelText: "Pincode (Required)*"),
                      ),
                      SizedBox(height: 20),
                      //country
                      TextFormField(
                        controller: TextEditingController(text: country),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        decoration: textFormFieldDecoration(
                            labelText: "Country (Required)*"),
                      ),
                      SizedBox(height: 20),
                      //state and city
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: TextEditingController(text: state),
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
                            controller: TextEditingController(text: city),
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
                        controller: TextEditingController(text: address1),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        decoration: textFormFieldDecoration(
                            labelText: "House No., Building Name (Required)*"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: TextEditingController(text: address2),
                        keyboardType: TextInputType.text,
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
                                Address address = Address(
                                    fullName: fullName.trim(),
                                    contact: int.parse(contact1),
                                    postalCode: pinCode,
                                    country: country.trim(),
                                    state: state.trim(),
                                    city: city.trim(),
                                    streetAddress1: address1.trim(),
                                    streetAddress2: address2.trim());
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            child: addressProvider.isSaveAddrLoader
                                ? buttonProgressIndicator()
                                : Text(
                                    "Update Address",
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
