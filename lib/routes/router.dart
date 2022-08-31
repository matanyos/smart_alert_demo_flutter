import 'package:auto_route/auto_route.dart';
import '../widgets/main_pages/home_page.dart';
import '../widgets/main_pages/login_page.dart';
import '../widgets/main_pages/my_progress_page.dart';
import '../widgets/main_pages/team_page.dart';
import 'authentication_guard.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: MyProgress, path: '/me', guards: [AuthGuard]),
    AutoRoute(page: Team, path: '/team', guards: [AuthGuard]),
    AutoRoute(page: LoginPage),
  ],
)
class $AppRouter {}
