import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/navigation_drawer.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  AppMenuItem currentMenuItem = AppMenuItem.myProgress;
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android) {
      return Scaffold(
          body: Row(children: [
        const NavigationDrawer(),
        Expanded(
            flex: 5,
            child: Container(
                color: Colors.grey.shade200,
                child: WidgetHelper.getWidgetView(
                    menuItem: currentMenuItem, context: context))),
      ]));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/logo.png', height: 60),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 26, 34, 37),
            toolbarHeight: 70,
          ),
          body: Container(
              color: Colors.grey.shade200,
              child: WidgetHelper.getWidgetView(
                  menuItem: currentMenuItem, context: context)),
          drawer: const NavigationDrawer());
    }
  }
}
