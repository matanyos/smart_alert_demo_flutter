import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:smart_alert_demo_flutter/utilitites/navigation_provider.dart';
import 'package:smart_alert_demo_flutter/widgets/footer.dart';
import 'package:smart_alert_demo_flutter/widgets/login_widget.dart';

import '../utilitites/utilities.dart';
import 'my_progress_view.dart';

class WidgetHelper {
  static Widget buildHeader(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top / 2),
        child: Container(
          height: 90,
          color: const Color.fromARGB(255, 26, 34, 37),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Image.asset('assets/iconGreen.PNG'),
            )
          ]),
        ));
  }

  static Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        createMenuItem(
            title: 'MY PROGRESS',
            menuItem: AppMenuItem.myProgress,
            icon: Icons.assessment,
            context: context),
        const SizedBox(height: 20),
        createMenuItem(
            title: 'PROFILE',
            menuItem: AppMenuItem.profile,
            icon: Icons.person,
            context: context),
        const SizedBox(height: 20),
        createMenuItem(
            title: 'USERS',
            menuItem: AppMenuItem.users,
            icon: Icons.people,
            context: context),
        const SizedBox(height: 40),
        const Divider(color: Colors.white),
        const SizedBox(height: 40),
        createMenuItem(
            title: 'Sync',
            menuItem: AppMenuItem._sync,
            icon: Icons.sync,
            context: context),
        const SizedBox(height: 20),
        createMenuItem(
            title: 'Support',
            menuItem: AppMenuItem.support,
            icon: Icons.support,
            onTapFunction: () {
              final Uri url = Uri(
                  scheme: 'https',
                  host: 'help.minuendo.com',
                  path: '/en/support/smart-alert-earplug',
                  query: 'utm_medium=link&utm_source=url');
              Utilities.openBrowserUrl(url: url);
            },
            context: context),
        const SizedBox(height: 20),
        createMenuItem(
            title: 'Log out',
            menuItem: AppMenuItem.logOut,
            icon: Icons.logout,
            onTapFunction: () {
              var box = Hive.box('myBox');
              box.delete('token');
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginWidget()));
            },
            context: context),
      ],
    );
  }

  static Widget createMenuItem(
      {required String title,
      required AppMenuItem menuItem,
      Function? onTapFunction,
      required IconData icon,
      required BuildContext context}) {
    double fontSize = (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android)
        ? 16
        : 22;
    double leftPadding = (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android)
        ? 20
        : 50;

    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = menuItem == currentItem;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Material(
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50))),
              leading: Icon(icon,
                  color: isSelected ? Colors.red : Colors.white,
                  size: isSelected ? 40 : 35),
              title: Text(title,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? const Color.fromARGB(255, 26, 34, 37)
                          : Colors.white)),
              selected: isSelected,
              selectedTileColor: Colors.grey.shade200,
              onTap: () {
                if (onTapFunction != null) {
                  onTapFunction.call();
                } else {
                  if (defaultTargetPlatform == TargetPlatform.iOS ||
                      defaultTargetPlatform == TargetPlatform.android) {
                    Navigator.pop(context);
                  }
                  provider.setCurrentAppMenuItem(menuItem);
                }
              }),
        ),
      ),
    );
  }

  static Widget getWidgetView(
      {required AppMenuItem menuItem, required BuildContext context}) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;

    if (currentItem == AppMenuItem.myProgress) {
      return const MyProgressViewWidget();
    } else if (currentItem == AppMenuItem.profile) {
      return const Text('Profile');
    } else if (currentItem == AppMenuItem.users) {
      return const Text('Users');
    } else {
      return const Text('Sync');
    }
  }

  static Widget getFooterWithPadding(
      {required bool isLogin, required BuildContext context}) {
    double value = MediaQuery.of(context).size.width / 12;

    return FittedBox(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(value, value, value, value / 2),
        child: Footer(isLoginPage: isLogin),
      ),
    );
  }
}

enum AppMenuItem { myProgress, profile, users, support, _sync, logOut }
