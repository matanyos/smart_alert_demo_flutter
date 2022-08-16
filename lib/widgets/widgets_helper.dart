import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/footer.dart';

import '../main.dart';
import '../utilities.dart';

class WidgetHelper
{
    static Widget buildHeader(BuildContext context)
    {
          return Container(
            padding:EdgeInsets.only(top:MediaQuery.of(context).padding.top),
            child: Container(height: 90,color:const Color.fromARGB(255,26,34,37),
            child: Row(
              children: [Padding(
                padding: const EdgeInsets.fromLTRB(20,30,0,0),
                child: Image.asset('assets/iconGreen.PNG'),
              )]),
          ));
    }
    static Widget buildMenuItems(BuildContext context, Function(AppMenuItem) selected)
    {
          return Column(
              children: [
                createMenuItem(title:'MY PROGRESS',icon: Icons.home_max_outlined, onTapFunction: ()=>selected(AppMenuItem.myProgress)),
                const SizedBox(height: 20),
                createMenuItem(title:'PROFILE',icon: Icons.person, onTapFunction: ()=>selected(AppMenuItem.profile)),
                const SizedBox(height: 20),
                createMenuItem(title:'USERS',icon: Icons.people,onTapFunction: ()=>selected(AppMenuItem.users)),
                const SizedBox(height: 40),  
                const Divider(color: Colors.white),
                const SizedBox(height: 40),
                createMenuItem(title:'Sync',icon: Icons.sync, onTapFunction: ()=>selected(AppMenuItem._sync)),
                const SizedBox(height: 20),  
                createMenuItem(title:'Support',icon: Icons.support,onTapFunction: () 
                {
                  final Uri url = Uri(scheme: 'https',host: 'help.minuendo.com',path: '/en/support/smart-alert-earplug',query: 'utm_medium=link&utm_source=url');
                  Utilities.openBrowserUrl(url: url);
                }),
                const SizedBox(height: 20),  
                createMenuItem(title:'Log out',icon: Icons.logout,onTapFunction: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SmartAlertDemoApp()));}),
              ],
            );
        }
    static Widget createMenuItem({required String title, required Function() onTapFunction, required IconData icon}) 
    {
        double fontSize = (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) ? 16 : 22;
        double leftPadding = (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) ? 20 : 40;
        
          return Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: ListTile(
                  leading: Icon(icon, color: Colors.white,size: 35),
                  title:  Text(title, style: TextStyle(fontSize: fontSize,color: Colors.white)),
                  onTap: ()=> onTapFunction()),
              );
    }
    static Widget getMyProgressView() 
    {
    return Expanded(
        child: Container(color: Colors.grey.shade200,
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Expanded(flex: 4,
                      child: Container(constraints: const BoxConstraints(maxWidth: 300),
                          color: Colors.white,
                          child: const Text('My Progress Info', style: TextStyle(fontSize: 30, color: Colors.red),),)),
                    const Expanded(flex: 1,
                      child:  FittedBox(
                          child: Padding(
                          padding: EdgeInsets.all(50),
                          child: Footer(isLoginPage: false),
                        )))
                        
                  ],),
                ),
              );
  }
}
  enum AppMenuItem {
  myProgress,
  profile,
  users,
  _sync,
}