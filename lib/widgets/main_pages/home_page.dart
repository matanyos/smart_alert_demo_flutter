import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/Enums/user_access_level.dart';
import '../../Models/user.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessLevel = User.getAccessLevel(user);
    var selectedItem = accessLevel == UserAccessLevel.user
        ? AppMenuItem.myProgress
        : AppMenuItem.team;

    AutoRouter.of(context)
        .pushNamed(selectedItem == AppMenuItem.myProgress ? '/me' : '/team');

    return Container();
  }
}
