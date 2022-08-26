import 'package:flutter/material.dart';
import 'package:zinotalens/controller/auth_controller.dart';
import 'package:zinotalens/database/temp_storage.dart';
import 'package:zinotalens/model/auth_verification_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthVerificationModel _verifiedResponse = AuthVerificationModel();
  bool _isSentOtp = false;
  String _authToken = "";

  bool get isSentOtp => _isSentOtp;
  String get authToken => _authToken;

  void loginProvider({required String contactNo}) async {
    try {
      _isSentOtp = await login(contactNo: contactNo);
    } catch (e) {
      print("error no 582: $e");
    }
    notifyListeners();
  }

  void verifyOtpProvider(
      {required String contactNo, required String otp}) async {
    try {
      _verifiedResponse = await verifyOtp(contactNo: contactNo, otp: otp);
      if (_verifiedResponse.success!) {
        TempStorage.setAuthToken(_verifiedResponse.token!);
        _authToken = _verifiedResponse.token!;
      }
    } catch (e) {
      print("error no 486: $e");
    }
    notifyListeners();
  }

  void getAuthTokenProvider() async {
    _authToken = await TempStorage.getAuthToken();
    notifyListeners();
  }
}
