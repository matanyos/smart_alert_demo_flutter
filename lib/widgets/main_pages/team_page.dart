import 'package:flutter/material.dart';
import '../../Enums/app_menu_item.dart';
import '../../utilitites/widgets_helper.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.team, const Text('Team'));
  }
}
