import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class NavigationDrawer extends StatelessWidget {

final Function(AppMenuItem) onMenuItemChanged;

    const NavigationDrawer({Key? key, required this.onMenuItemChanged}) : super(key: key);
  @override
    Widget build(BuildContext context) 
{
  double widthValue = (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) ? 300 : 400;

    return Drawer(
    width: widthValue,
    backgroundColor: const Color.fromARGB(255,26,34,37),
      child:SingleChildScrollView(
        child: Container(
          color:const Color.fromARGB(255,26,34,37) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WidgetHelper.buildHeader(context),
              Padding(
                padding: const EdgeInsets.only(top:30),
                 child: WidgetHelper.buildMenuItems(
                  context,
                  (item)=>{onMenuItemChanged(item)}))
            ],),
        )));
}

} 