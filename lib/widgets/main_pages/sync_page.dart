import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/utilitites/widgets_helper.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.sync, const Text('Sync'));
  }
}
