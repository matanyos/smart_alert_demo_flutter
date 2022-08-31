// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:smart_alert_demo_flutter/Models/user.dart' as _i8;
import 'package:smart_alert_demo_flutter/routes/authentication_guard.dart'
    as _i7;
import 'package:smart_alert_demo_flutter/widgets/main_pages/home_page.dart'
    as _i1;
import 'package:smart_alert_demo_flutter/widgets/main_pages/login_page.dart'
    as _i4;
import 'package:smart_alert_demo_flutter/widgets/main_pages/my_progress_page.dart'
    as _i2;
import 'package:smart_alert_demo_flutter/widgets/main_pages/team_page.dart'
    as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.HomePage(key: args.key, user: args.user));
    },
    MyProgress.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyProgress());
    },
    Team.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Team());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.LoginPage(
              key: args.key, emailDefaultValue: args.emailDefaultValue));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        _i5.RouteConfig(MyProgress.name, path: '/me', guards: [authGuard]),
        _i5.RouteConfig(Team.name, path: '/team', guards: [authGuard]),
        _i5.RouteConfig(LoginRoute.name, path: '/login-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key, required _i8.User user})
      : super(HomeRoute.name,
            path: '/', args: HomeRouteArgs(key: key, user: user));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.user});

  final _i6.Key? key;

  final _i8.User user;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i2.MyProgress]
class MyProgress extends _i5.PageRouteInfo<void> {
  const MyProgress() : super(MyProgress.name, path: '/me');

  static const String name = 'MyProgress';
}

/// generated route for
/// [_i3.Team]
class Team extends _i5.PageRouteInfo<void> {
  const Team() : super(Team.name, path: '/team');

  static const String name = 'Team';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i6.Key? key, String? emailDefaultValue})
      : super(LoginRoute.name,
            path: '/login-page',
            args:
                LoginRouteArgs(key: key, emailDefaultValue: emailDefaultValue));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.emailDefaultValue});

  final _i6.Key? key;

  final String? emailDefaultValue;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, emailDefaultValue: $emailDefaultValue}';
  }
}
