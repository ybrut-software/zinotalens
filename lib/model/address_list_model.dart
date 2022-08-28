// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) =>
    AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) =>
    json.encode(data.toJson());

class AddressListModel {
  AddressListModel({
    this.success,
    this.addresses,
  });

  bool? success;
  List<Address>? addresses;

  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      AddressListModel(
        success: json["success"],
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.fullName,
    this.streetAddress1,
    this.streetAddress2,
    this.contact,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? fullName;
  String? streetAddress1;
  String? streetAddress2;
  int? contact;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool selected = false;

  set setSelected(bool selected) {
    this.selected = selected;
  }

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        fullName: json["fullName"],
        streetAddress1: json["street_address_1"],
        streetAddress2: json["street_address_2"],
        contact: json["contact"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "street_address_1": streetAddress1,
        "street_address_2": streetAddress2,
        "contact": contact,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
