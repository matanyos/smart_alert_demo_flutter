import 'package:flutter/foundation.dart';
import 'package:smart_alert_demo_flutter/widgets/widgets_helper.dart';

class NavigationProvider extends ChangeNotifier{
  AppMenuItem menuItem = AppMenuItem.myProgress;

  AppMenuItem get navigationItem => menuItem;

  void setCurrentAppMenuItem(AppMenuItem item)
{
  menuItem = item;
  notifyListeners();
}
}
