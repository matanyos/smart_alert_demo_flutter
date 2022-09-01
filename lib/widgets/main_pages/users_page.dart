import 'package:flutter/material.dart';
import '../../Enums/app_menu_item.dart';
import '../../utilitites/widgets_helper.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetHelper.getWidgetViewMobileOrWeb(
        context, AppMenuItem.users, const Text('Users'));
  }
}
