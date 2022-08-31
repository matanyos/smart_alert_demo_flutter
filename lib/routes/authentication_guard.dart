import 'package:auto_route/auto_route.dart';
import 'package:smart_alert_demo_flutter/routes/router.gr.dart';
import 'package:smart_alert_demo_flutter/utilitites/utilities.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    var user = await Utilities.getUserInfo();
    if (user != null) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}
