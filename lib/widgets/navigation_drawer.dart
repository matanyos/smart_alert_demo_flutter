import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/utilitites/navigation_drawer_utilitites.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';

class NavigationDrawer extends StatefulWidget {
  final AppMenuItem selectedItem;
  const NavigationDrawer({Key? key, required this.selectedItem})
      : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    var platformInfo = PlatformInfo(context);

    var screenWidth = platformInfo.getScreenSize().width;
    double widthValue =
        platformInfo.isMobile() ? 0.8 * screenWidth : 0.15 * screenWidth;

    return Drawer(
        width: widthValue,
        child: Container(
          color: const Color.fromARGB(255, 26, 34, 37),
          child: ListView(
            children: [
              Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: NavigationDrawerUtilities.buildHeader(context)),
                Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: NavigationDrawerUtilities.buildMenuItems(
                        context: context, selectedItem: widget.selectedItem)),
              ])
            ],
          ),
        ));
  }
}
