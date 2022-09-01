import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_alert_demo_flutter/Models/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../Models/login_credentials.dart';
import 'encryptor.dart';

class Utilities {
  static Future<void> openBrowserUrl({required Uri url}) async {
    await launchUrl(url, mode: LaunchMode.platformDefault);
  }

  static Future<bool> isSuccessHttpRequest(
      {required String token, required String userId}) async {
    var url = Uri.parse('https://dev.api.minuendo.com/accounts/$userId');

    var response = await http.get(url, headers: {
      'token': token,
    });

    return response.statusCode == 200;
  }

  static Future<User?> acquireAccessToken(LoginCredentials user) async {
    var url = Uri.https('dev.api.minuendo.com', 'Security/Login');
    var payload = jsonEncode(user);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: payload);

    return User.fromJson(jsonDecode(response.body));
  }

  static Future<bool> tryLogin(
      {required String email, required String password}) async {
    try {
      var response = await Utilities.acquireAccessToken(
          LoginCredentials(email: email, password: password));

      if (response?.authenticationToken == null) return false;

      var encrypted = Encryptor().encrypt(value: jsonEncode(response));

      var box = await Hive.openBox('appBox');
      await box.put('userInfo', encrypted);

      return true;
    } catch (e) {
      return false;
    }
  }

  static tryRequestNewPassword({required String email}) async {
    var url =
        Uri.https('dev.api.minuendo.com', 'Security/RequestResetPassword');
    var payload = "{\"email\":\"$email\"}";
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: payload);

    return response.statusCode == 200;
  }

  static Future<bool> checkAccessToken() async {
    var user = getUser();
    if (user == null) return false;

    return await Utilities.isSuccessHttpRequest(
        token: user.authenticationToken.toString(),
        userId: user.userId.toString());
  }

  static User? getUser() {
    var box = Hive.box('appBox');
    var existedInfo = box.get('userInfo');
    if (existedInfo != null) {
      var info = Encryptor().decrypt(value: existedInfo);
      return User.fromJson(jsonDecode(info));
    }
    return null;
  }
}
