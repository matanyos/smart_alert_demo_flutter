import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_alert_demo_flutter/navigation_provider.dart';
import 'package:smart_alert_demo_flutter/widgets/login_widget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context)=> NavigationProvider(),
    child: const MaterialApp(
      home: SmartAlertDemoApp(),
      title: "Smart Alert | Minuendo",
      ),
  ));
}

class SmartAlertDemoApp extends StatelessWidget {
  const SmartAlertDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(alignment: Alignment.center,
          child: Column (
            children: 
             [
              SizedBox(
                height: 100,
                child: Image.asset('assets/logo.png')),
              const Text(
                "Smart Alert",
                style: TextStyle(fontFamily: 'Montserrat',letterSpacing: 1,fontSize: 26)),
             ])),
          backgroundColor: const Color.fromARGB(255,26,34,37),
          toolbarHeight: 180,
        ),
        body: const LoginWidget(),
        backgroundColor: const Color.fromARGB(255, 28, 34, 37),
      );
  }
}

