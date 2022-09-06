import 'package:shared_preferences/shared_preferences.dart';

class TempStorage {
  static const authToken = "auth_token";

  //get token
  static Future<String> getAuthToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(authToken) ?? "";
  }

  //set token
  static setAuthToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(authToken, token);
  }

  //clear all data in shared preference
  static removePreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(authToken);
  }
}
