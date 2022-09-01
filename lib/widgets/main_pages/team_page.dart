import 'package:flutter/material.dart';
import '../../Enums/app_menu_item.dart';
import '../../utilitites/widgets_helper.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.team, const Text('Team'));
  }
}
