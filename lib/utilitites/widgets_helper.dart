import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';
import 'package:smart_alert_demo_flutter/widgets/footer.dart';
import 'package:smart_alert_demo_flutter/widgets/navigation_drawer.dart';
import '../Enums/app_menu_item.dart';
import '../widgets/main_pages/login_page.dart';
import 'utilities.dart';

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

  static Widget buildMenuItems(
      {required BuildContext context, required AppMenuItem selectedItem}) {
    var isMobile = PlatformInfo(context).isMobile();
    double spacing = isMobile ? 5 : 20;
    return Column(
      children: [
        createMenuItem(
            title: 'MY PROGRESS',
            menuItem: AppMenuItem.myProgress,
            icon: Icons.assessment,
            context: context,
            isSelected: selectedItem == AppMenuItem.myProgress),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'PROFILE',
            menuItem: AppMenuItem.profile,
            icon: Icons.person,
            context: context,
            isSelected: selectedItem == AppMenuItem.profile),
        SizedBox(height: spacing),
        createMenuItem(
            title: 'USERS',
            menuItem: AppMenuItem.users,
            icon: Icons.people,
            context: context,
            isSelected: selectedItem == AppMenuItem.users),
        SizedBox(height: spacing * 2),
        const Divider(color: Colors.white),
        SizedBox(height: spacing * 2),
        createMenuItem(
            title: 'Sync',
            menuItem: AppMenuItem.sync,
            icon: Icons.sync,
            context: context,
            isSelected: selectedItem == AppMenuItem.sync),
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
              await Hive.box('myBox').delete('userInfo');
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
    double leftPadding = isMobile ? 20 : 50;

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

  static Widget getFooterWithPadding(
      {required bool isLogin, required BuildContext context}) {
    var screenSize = PlatformInfo(context).getScreenSize();
    double width = screenSize.width / 12;
    double height = screenSize.width / 12;

    return Padding(
      padding: EdgeInsets.fromLTRB(height, width, width, height / 3),
      child: Footer(isLoginPage: isLogin),
    );
  }

  static Widget getWidgetViewMobileOrWeb(
      BuildContext context, AppMenuItem selectedItem, Column childWidget) {
    if (!PlatformInfo(context).isMobile()) {
      return SafeArea(
        child: Scaffold(
            body: Row(children: [
          NavigationDrawer(selectedItem: selectedItem),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey.shade200,
                child: childWidget,
              ))
        ])),
      );
    } else {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Image.asset('assets/icon.png', height: 60),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 26, 34, 37),
                toolbarHeight: 70,
              ),
              body: Container(color: Colors.grey.shade200, child: childWidget),
              drawer: NavigationDrawer(selectedItem: selectedItem)));
    }
  }
}
