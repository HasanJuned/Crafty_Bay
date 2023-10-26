import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;
  static bool? _readProfile = false;

  static String? get accessToken => _accessToken;
  static bool? get readProfile => _readProfile;

  /// set user token
  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> setReadProfile(String read_profile) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('read_profile', read_profile);
    _readProfile = true;
  }

  /// get user token
  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> getReadProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _readProfile = true;
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
   await sharedPreferences.clear();
  }

  /// user already logged in or not
  static bool isLoggedIn() {
    return _accessToken != null;
  }
}
