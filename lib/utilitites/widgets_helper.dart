import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';
import 'package:smart_alert_demo_flutter/widgets/footer.dart';
import 'package:smart_alert_demo_flutter/widgets/navigation_drawer.dart';
import '../Enums/app_menu_item.dart';

class WidgetHelper {
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
      BuildContext context, AppMenuItem selectedItem, Widget childWidget) {
    if (!PlatformInfo(context).isMobile()) {
      return SafeArea(
        child: Scaffold(
            body: Row(children: [
          NavigationDrawer(selectedItem: selectedItem),
          Expanded(
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
