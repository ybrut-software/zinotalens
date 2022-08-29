// To parse this JSON data, do
//
//     final singleAddressModel = singleAddressModelFromJson(jsonString);

import 'dart:convert';

SingleAddressModel singleAddressModelFromJson(String str) =>
    SingleAddressModel.fromJson(json.decode(str));

String singleAddressModelToJson(SingleAddressModel data) =>
    json.encode(data.toJson());

class SingleAddressModel {
  SingleAddressModel({
    this.success,
    this.address,
  });

  bool? success;
  SingleAddress? address;

  factory SingleAddressModel.fromJson(Map<String, dynamic> json) =>
      SingleAddressModel(
        success: json["success"],
        address: SingleAddress.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "address": address?.toJson(),
      };
}

class SingleAddress {
  SingleAddress({
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

  factory SingleAddress.fromJson(Map<String, dynamic> json) => SingleAddress(
        id: json["_id"] ?? "",
        fullName: json["fullName"] ?? "",
        streetAddress1: json["street_address_1"] ?? "",
        streetAddress2: json["street_address_2"] ?? "",
        contact: json["contact"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        postalCode: json["postal_code"] ?? "",
        user: json["user"] ?? "",
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
