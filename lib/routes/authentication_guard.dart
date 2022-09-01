import 'package:auto_route/auto_route.dart';
import 'package:smart_alert_demo_flutter/routes/router.gr.dart';
import 'package:smart_alert_demo_flutter/utilitites/utilities.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var user = Utilities.getUser();
    if (user != null) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}
