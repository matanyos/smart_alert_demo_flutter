import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/home_page.dart';
import '../widgets/login_widget.dart';

class RouterManager {
  static const String homePage = '/';
  static const String loginPage = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginWidget());
      case homePage:
        return getHomePageMaterialRoute();
      default:
        throw ('This route name does not exist');
    }
  }

  static dynamic getHomePageMaterialRoute() {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageRoute(builder: (context) => const HomePage())
        : MaterialPageRoute(builder: (context) => const HomePage());
  }
}
