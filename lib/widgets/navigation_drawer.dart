import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/utilitites/platform_info.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var platformInfo = PlatformInfo(context);
    double widthValue = platformInfo.isMobile()
        ? 0.8 * platformInfo.getScreenSize().width
        : 0.2 * platformInfo.getScreenSize().width;

    return Drawer(
        width: widthValue,
        child: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 26, 34, 37),
          child: ListView(
            children: [
              Column(children: [
                WidgetHelper.buildHeader(context),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: WidgetHelper.buildMenuItems(context)),
              ])
            ],
          ),
        ));
  }
}
