import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/navigation_drawer.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
  AppMenuItem currentMenuItem = AppMenuItem.myProgress;
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        appBar:AppBar(
          title: Image.asset('assets/logo.png',height: 60),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255,26,34,37),
          toolbarHeight:70,
        ),
        body: Container(
          color: Colors.grey.shade200,
          child: Column(children: [WidgetHelper.getWidgetView(menuItem: currentMenuItem,context: context)])),
        drawer: const NavigationDrawer());
  }
}

class FullScreenHomePage extends StatefulWidget {
  const FullScreenHomePage({Key? key}) : super(key: key);

  @override
  State<FullScreenHomePage> createState() => _FullScreenHomePageState();
}

class _FullScreenHomePageState extends State<FullScreenHomePage> {

  AppMenuItem currentMenuItem = AppMenuItem.myProgress;
  
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
         const NavigationDrawer(),
         Expanded(child: Container(color: Colors.grey.shade200, child: WidgetHelper.getWidgetView(menuItem: currentMenuItem,context: context))),
      ]
    )
  );

} 