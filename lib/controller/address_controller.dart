import 'dart:convert';

import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/model/single_address_model.dart';
import 'package:zinotalens/services/api_client.dart';

Future<List<Address>> fetchAddressList(String token) async {
  var resJson = await ApiClient.getServices().fetchAddressesApi(token);
  AddressListModel addressListModel = addressListModelFromJson(resJson);
  return addressListModel.addresses!;
}

Future<bool> saveAddress(String token, Address address) async {
  String body = jsonEncode(address.toJson());
  var resJson = await ApiClient.getServices().saveAddressApi(token, body);
  Map<String, dynamic> response = jsonDecode(resJson);
  return response["success"];
}

Future<bool> deleteAddress(String token, String addressId) async {
  var resJson =
      await ApiClient.getServices().deleteAddressApi(token, addressId);
  Map<String, dynamic> response = jsonDecode(resJson);
  return response["success"];
}

Future<SingleAddress> fetchSingleAddress(String token, String addressId) async {
  var resJson =
      await ApiClient.getServices().fetchSingleAddressApi(token, addressId);
  SingleAddressModel singleAddressModel = singleAddressModelFromJson(resJson);
  return singleAddressModel.address!; //response["address"];
}

Future<bool> updateAddress(
    String token, String addressId, Address addressObj) async {
  var reqJson = jsonEncode(addressObj.toJson());
  var resJson =
      await ApiClient.getServices().updateAddressApi(token, addressId, reqJson);
  Map<String, dynamic> response = jsonDecode(resJson);
  return response["success"];
}
