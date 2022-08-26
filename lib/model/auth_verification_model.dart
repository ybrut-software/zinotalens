// To parse this JSON data, do
//
//     final authVerificationModel = authVerificationModelFromJson(jsonString);

import 'dart:convert';

AuthVerificationModel authVerificationModelFromJson(String str) =>
    AuthVerificationModel.fromJson(json.decode(str));

String authVerificationModelToJson(AuthVerificationModel data) =>
    json.encode(data.toJson());

class AuthVerificationModel {
  AuthVerificationModel({
    this.success,
    this.msg,
    this.token,
  });

  bool? success;
  String? msg;
  String? token;

  factory AuthVerificationModel.fromJson(Map<String, dynamic> json) =>
      AuthVerificationModel(
        success: json["success"],
        msg: json["msg"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "token": token,
      };
}
