import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/utilitites/widgets_helper.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.admin, const Text('Admin'));
  }
}
