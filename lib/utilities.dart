import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_alert_demo_flutter/Models/login_respone.dart';
import 'package:smart_alert_demo_flutter/widgets/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'Models/user.dart';
import 'encryptor.dart';

class Utilities {
  static Future<void> openBrowserUrl({required Uri url}) async {
    await launchUrl(url, mode: LaunchMode.platformDefault);
  }

  static Future<bool> isSuccessHttpRequest({required String token,required String userId}) async{
    var url = Uri.parse('https://dev.api.minuendo.com/accounts/$userId');

    var response = await http.get(url, headers: {'token': token,});
        
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

  static void navigateToHomePage(BuildContext context) {
    Widget homePage = defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android
        ? const HomePage()
        : const FullScreenHomePage();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => homePage)
            : MaterialPageRoute(builder: (context) => homePage));
  }

  static Future<bool> tryLogin(
      {required String email, required String password}) async {

    var response = await Utilities.acquireAccessToken(User(email: email, password: password));
    var storage = const FlutterSecureStorage();

    if (response == null) return false;

    var en = Encryptor().encrypt(value: jsonEncode(response));
    await storage.write(key: 'userInfo', value: en);
    return true;
  }
}
