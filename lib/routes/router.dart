import 'package:auto_route/auto_route.dart';
import 'package:smart_alert_demo_flutter/widgets/forget_password_widget.dart';
import 'package:smart_alert_demo_flutter/widgets/main_pages/profile_page.dart';
import '../widgets/main_pages/home_page.dart';
import '../widgets/main_pages/login_page.dart';
import '../widgets/main_pages/my_progress_page.dart';
import '../widgets/main_pages/team_page.dart';
import 'authentication_guard.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: '/', initial: true, guards: [AuthGuard]),
    AutoRoute(page: MyProgress, path: '/me', guards: [AuthGuard]),
    AutoRoute(page: Team, path: '/team', guards: [AuthGuard]),
    AutoRoute(page: ProfilePage, path: '/profile', guards: [AuthGuard]),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: ForgetPasswordWidget, path: '/forgot-password'),
  ],
)
class $AppRouter {}
