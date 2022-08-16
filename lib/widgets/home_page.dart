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
          title: Container(alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              height: 50,
              child: Image.asset('assets/logo.png')),
          )),
          backgroundColor: const Color.fromARGB(255,26,34,37),
          toolbarHeight: 50,
        ),
        drawer: NavigationDrawer(onMenuItemChanged: (item) => setState(()=> currentMenuItem = item)));
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
         NavigationDrawer(onMenuItemChanged: (item) => setState(()=> currentMenuItem = item)),
         getWidgetView(menuItem: currentMenuItem),
      ]
    )
  );

  Widget getWidgetView({required AppMenuItem menuItem})
  {
    if(menuItem == AppMenuItem.myProgress)
      {    
        return WidgetHelper.getMyProgressView();
      }
      else if(menuItem == AppMenuItem.profile)
      {
        return const Text('Profile');
      }
      else if(menuItem == AppMenuItem.users)
      {
        return const Text('Users');
      }
      else
      {
        return const Text('Sync');
      }
  }

} 