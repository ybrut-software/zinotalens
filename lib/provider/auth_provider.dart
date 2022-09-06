import 'package:flutter/material.dart';
import 'package:zinotalens/controller/auth_controller.dart';
import 'package:zinotalens/database/temp_storage.dart';
import 'package:zinotalens/model/auth_verification_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthVerificationModel _verifiedResponse = AuthVerificationModel();
  bool _isSentOtp = false;
  String _authToken = "";

  bool get isSentOtp => _isSentOtp;
  String get getAuthToken => _authToken;

  bool _loginProgress = false;
  bool _verifyProgress = false;

  bool get getLoginProgress => _loginProgress;
  bool get getVerifyProgress => _verifyProgress;

  set setLoginProgress(bool loginProgress) {
    _loginProgress = loginProgress;
    notifyListeners();
  }

  set setVerifyProgress(bool verifyProgress) {
    _verifyProgress = verifyProgress;
    notifyListeners();
  }

  Future<bool> loginProvider({required String contactNo}) async {
    try {
      _isSentOtp = await login(contactNo: contactNo);
      _loginProgress = false;
    } catch (e) {
      print("error no 582: $e");
      _loginProgress = false;
      _isSentOtp = false;
    }
    notifyListeners();
    return _isSentOtp;
  }

  Future<bool> verifyOtpProvider(
      {required String contactNo, required String otp}) async {
    bool _success = false;
    try {
      _verifiedResponse = await verifyOtp(contactNo: contactNo, otp: otp);
      if (_verifiedResponse.success!) {
        _success = _verifiedResponse.success!;
        TempStorage.setAuthToken(_verifiedResponse.token!);
        _authToken = _verifiedResponse.token!;
      }
      _verifyProgress = false;
    } catch (e) {
      print("error no 486: $e");
      _verifyProgress = false;
      _success = false;
    }
    notifyListeners();
    return _success;
  }

  void getAuthTokenProvider() async {
    _authToken = await TempStorage.getAuthToken();
    notifyListeners();
  }

  void clearTokenProvider() {
    TempStorage.removePreferences();
    _authToken = "";
    notifyListeners();
  }
}
