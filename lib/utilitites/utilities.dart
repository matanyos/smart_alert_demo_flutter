import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_alert_demo_flutter/Models/login_respone.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../Models/user.dart';
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

  static Future<LoginResponse?> acquireAccessToken(User user) async {
    var url = Uri.https('dev.api.minuendo.com', 'Security/Login');
    var payload = jsonEncode(user);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: payload);

    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<bool> tryLogin(
      {required String email, required String password}) async {
    var response = await Utilities.acquireAccessToken(
        User(email: email, password: password));
    var box = Hive.box('myBox');

    if (response?.authenticationToken == null) return false;

    var encrypted = Encryptor().encrypt(value: jsonEncode(response));
    await box.put('userInfo', encrypted);

    return true;
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
    await Hive.initFlutter();
    var box = await Hive.openBox('myBox');
    var existedInfo = box.get('userInfo');

    if (existedInfo == null) return false;

    var info = Encryptor().decrypt(value: existedInfo);
    var userInfo = LoginResponse.fromJson(jsonDecode(info));

    return await Utilities.isSuccessHttpRequest(
        token: userInfo.authenticationToken.toString(),
        userId: userInfo.userId.toString());
  }
}
