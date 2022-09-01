import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';

import '../Enums/app_menu_item.dart';
import 'utilities.dart';

class NavigationDrawerUtilities {
  static Widget buildHeader(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 40, 0, 0),
        height: 120,
        child: Row(children: [Image.asset('assets/iconGreen.PNG')]),
      ),
    );
  }

  static Widget buildMenuItems(
      {required BuildContext context, required AppMenuItem selectedItem}) {
    var router = AutoRouter.of(context);
    var isMobile = PlatformInfo(context).isMobile();
    double spacing = isMobile ? 5 : 20;
    return Column(
      children: [
        createMenuItem(
            title: 'MY PROGRESS',
            menuItem: AppMenuItem.myProgress,
            icon: Icons.assessment,
            context: context,
            isSelected: selectedItem == AppMenuItem.myProgress,
            onTapFunction: () => router.pushNamed('/me')),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'PROFILE',
            menuItem: AppMenuItem.profile,
            icon: Icons.person,
            context: context,
            isSelected: selectedItem == AppMenuItem.profile,
            onTapFunction: () => router.pushNamed('/profile')),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'USERS',
            menuItem: AppMenuItem.users,
            icon: Icons.people,
            context: context,
            isSelected: selectedItem == AppMenuItem.users,
            onTapFunction: () => router.pushNamed('/users')),
        SizedBox(height: spacing * 2),
        const Divider(color: Colors.white),
        SizedBox(height: spacing * 2),
        createMenuItem(
            title: 'Sync',
            menuItem: AppMenuItem.sync,
            icon: Icons.sync,
            context: context,
            isSelected: selectedItem == AppMenuItem.sync,
            onTapFunction: () => router.pushNamed('/sync')),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'Support',
            menuItem: AppMenuItem.support,
            icon: Icons.favorite_outline,
            onTapFunction: () {
              final Uri url = Uri(
                  scheme: 'https',
                  host: 'help.minuendo.com',
                  path: '/en/support/smart-alert-earplug',
                  query: 'utm_medium=link&utm_source=url');
              Utilities.openBrowserUrl(url: url);
            },
            context: context,
            isSelected: false,
            support: true),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'Log out',
            menuItem: AppMenuItem.logOut,
            icon: Icons.logout,
            onTapFunction: () async {
              AutoRouter.of(context).pushNamed('/login');
              await Hive.box('appBox').delete('userInfo');
            },
            context: context,
            isSelected: false),
      ],
    );
  }

  static Widget createMenuItem(
      {required String title,
      required AppMenuItem menuItem,
      Function? onTapFunction,
      required IconData icon,
      required BuildContext context,
      required bool isSelected,
      bool support = false}) {
    var isMobile = PlatformInfo(context).isMobile();
    double fontSize = isMobile ? 15 : 20;
    double leftPadding = isMobile ? 20 : 30;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Material(
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ListTile(
              visualDensity: const VisualDensity(vertical: 4),
              hoverColor: Colors.white10,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50))),
              leading: Icon(icon,
                  color: isSelected ? Colors.red : Colors.white,
                  size: isSelected ? 40 : 35),
              title: Row(
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color.fromARGB(255, 26, 34, 37)
                              : Colors.white)),
                  if (support) const SizedBox(width: 10),
                  if (support)
                    const Icon(Icons.open_in_new,
                        color: Colors.white70, size: 20)
                ],
              ),
              selected: isSelected,
              selectedTileColor: Colors.grey.shade200,
              onTap: () {
                if (onTapFunction != null) {
                  onTapFunction.call();
                } else {
                  if (isMobile) {
                    Navigator.pop(context);
                  }
                  //provider.setCurrentAppMenuItem(menuItem);
                }
              }),
        ),
      ),
    );
  }
}
