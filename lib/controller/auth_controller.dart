import 'dart:convert';

import 'package:zinotalens/model/auth_verification_model.dart';
import 'package:zinotalens/services/api_client.dart';

Future<bool> login({required String contactNo}) async {
  Map<String, dynamic> body = {"contact": contactNo};
  String reqjson = jsonEncode(body);
  var resjson = await ApiClient.getServices().loginApi(reqjson);
  Map<String, dynamic> res = jsonDecode(resjson);
  bool success = res["success"];
  bool next = res["next"];
  return success && next;
}

Future<AuthVerificationModel> verifyOtp(
    {required String contactNo, required String otp}) async {
  Map<String, dynamic> body = {"contact": contactNo, "OTP": otp};
  String reqjson = jsonEncode(body);
  var resjson = await ApiClient.getServices().verifyOtpApi(reqjson);
  AuthVerificationModel authVerificationModel =
      authVerificationModelFromJson(resjson);
  return authVerificationModel;
}
