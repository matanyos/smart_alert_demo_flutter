import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_alert_demo_flutter/utilitites/navigation_provider.dart';
import 'package:smart_alert_demo_flutter/router/router.dart';
import 'package:smart_alert_demo_flutter/utilitites/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var canAccess = await Utilities.checkAccessToken();

  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      title: "Smart Alert | Minuendo",
      initialRoute:
          canAccess ? RouterManager.homePage : RouterManager.loginPage,
      onGenerateRoute: RouterManager.generateRoute,
    ),
  ));
}
