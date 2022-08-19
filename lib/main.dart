import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:smart_alert_demo_flutter/navigation_provider.dart';
import 'package:smart_alert_demo_flutter/utilities.dart';
import 'package:smart_alert_demo_flutter/widgets/home_page.dart';
import 'package:smart_alert_demo_flutter/widgets/login_widget.dart';

import 'Models/login_respone.dart';
import 'encryptor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var isValid = await checkAccessToken();
  var homePage = defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android
      ? const HomePage()
      : const FullScreenHomePage();

  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      home: isValid ? homePage : const SmartAlertDemoApp(),
      title: "Smart Alert | Minuendo",
    ),
  ));
}

Future<bool> checkAccessToken() async {
  var storage = const FlutterSecureStorage();
  var existedInfo = await storage.read(key: 'userInfo');

  if (existedInfo == null) return false;

  var info = Encryptor().decrypt(value: existedInfo);
  var userInfo = LoginResponse.fromJson(jsonDecode(info));
  
  return await Utilities.isSuccessHttpRequest(
    token: userInfo.authenticationToken.toString(),
    userId: userInfo.userId.toString());
}

class SmartAlertDemoApp extends StatelessWidget {
  const SmartAlertDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(height: 100, child: Image.asset('assets/logo.png')),
              const Text("Smart Alert",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      letterSpacing: 1,
                      fontSize: 26)),
            ])),
        backgroundColor: const Color.fromARGB(255, 26, 34, 37),
        toolbarHeight: 180,
      ),
      body: const LoginWidget(),
      backgroundColor: const Color.fromARGB(255, 28, 34, 37),
    );
  }
}
