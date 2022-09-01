import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_alert_demo_flutter/Enums/app_menu_item.dart';
import 'package:smart_alert_demo_flutter/Enums/user_access_level.dart';
import '../../Models/user.dart';
import '../../utilitites/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var accessLevel = User.getAccessLevel(Utilities.getUser());
    var selectedItem = accessLevel == UserAccessLevel.user
        ? AppMenuItem.myProgress
        : AppMenuItem.team;

    AutoRouter.of(context)
        .pushNamed(selectedItem == AppMenuItem.myProgress ? '/me' : '/team');

    return Container();
  }
}
