import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:zinotalens/model/single_address_model.dart';
import 'package:zinotalens/provider/address_provider.dart';
import 'package:zinotalens/provider/auth_provider.dart';
import 'package:zinotalens/utils/colors.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';
import 'package:zinotalens/widgets/progress_indicator.dart';

import '../model/address_list_model.dart';
import '../utils/style.dart';

class UpdateDeliveryAddressPage extends StatefulWidget {
  final addressId;
  final index;
  UpdateDeliveryAddressPage(this.addressId, this.index, {Key? key})
      : super(key: key);

  @override
  State<UpdateDeliveryAddressPage> createState() =>
      _UpdateDeliveryAddressPageState();
}

class _UpdateDeliveryAddressPageState extends State<UpdateDeliveryAddressPage> {
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
                        controller: fullNameController
                          ..text = address.fullName!,
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        decoration: textFormFieldDecoration(
                            labelText: "Full Name (Required)*"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: contact1Controller
                          ..text = address.contact.toString(),
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
                        decoration: textFormFieldDecoration(
                            labelText: "Alternate Phone number (Optional)"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: pincodeController
                          ..text = address.postalCode!,
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
                        controller: countryController..text = address.country!,
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
                            controller: stateController..text = address.state!,
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
                            controller: cityController..text = address.city!,
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
                        controller: address1Controller
                          ..text = address.streetAddress1!,
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
                        controller: address2Controller
                          ..text = address.streetAddress2!,
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
                                addressProvider.setIsUpdateLoader = true;
                                Address address = Address(
                                    id: widget.addressId,
                                    fullName: fullNameController.text.trim(),
                                    contact: int.parse(contact1Controller.text),
                                    postalCode: pincodeController.text.trim(),
                                    country: countryController.text.trim(),
                                    state: stateController.text.trim(),
                                    city: cityController.text.trim(),
                                    streetAddress1:
                                        address1Controller.text.trim(),
                                    streetAddress2:
                                        address2Controller.text.trim());
                                addressProvider.updateAddressProvider(
                                    token: token,
                                    addressId: widget.addressId,
                                    index: widget.index,
                                    context: context,
                                    addressObj: address);
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            child: addressProvider.isUpdateLoader
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

  getAddressData(addressProvider) {
    SingleAddress address = addressProvider.singleAddress;

    if (address.id == widget.addressId) {
      fullNameController = TextEditingController(text: address.fullName);
      contact1Controller =
          TextEditingController(text: address.contact.toString());
      contact2Controller = TextEditingController();
      pincodeController = TextEditingController(text: address.postalCode);
      stateController = TextEditingController(text: address.state);
      cityController = TextEditingController(text: address.city);
      countryController = TextEditingController(text: address.country);
      address1Controller = TextEditingController(text: address.streetAddress1);
      address2Controller = TextEditingController(text: address.streetAddress2);
    }
  }
}
