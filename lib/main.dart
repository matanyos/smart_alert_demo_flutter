import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_alert_demo_flutter/routes/authentication_guard.dart';
import 'package:smart_alert_demo_flutter/routes/router.gr.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

final appRouter = AppRouter(authGuard: AuthGuard());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Smart Alert | Minuendo",
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
