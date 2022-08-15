import 'dart:html';

import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/footer.dart';
import 'package:smart_alert_demo_flutter/widgets/navigation_drawer.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        appBar:AppBar(
          title: Container(alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              height: 50,
              child: Image.asset('assets/logo.png')),
          )),
          backgroundColor: const Color.fromARGB(255,26,34,37),
          toolbarHeight: 50,
        ),
        drawer: const NavigationDrawer(),);
  }
}
class FullScreenHomePage extends StatefulWidget {
  const FullScreenHomePage({Key? key}) : super(key: key);

  @override
  State<FullScreenHomePage> createState() => _FullScreenHomePageState();
}

class _FullScreenHomePageState extends State<FullScreenHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
         const NavigationDrawer(),
         Expanded(
           child: Container(color: Colors.grey.shade200,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Expanded(flex: 4,
                    child: Container(color: Colors.amber,child: const Text('TEXT'),)),
                const Expanded(flex: 1,
                  child:  FittedBox(
                    child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Footer(isLoginPage: false),
                  )))
                   
             ],),
           ),
         ),
      ]
    )
  );
} 