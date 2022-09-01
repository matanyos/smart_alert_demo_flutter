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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:smart_alert_demo_flutter/routes/authentication_guard.dart'
    as _i9;
import 'package:smart_alert_demo_flutter/widgets/forget_password_widget.dart'
    as _i6;
import 'package:smart_alert_demo_flutter/widgets/main_pages/home_page.dart'
    as _i1;
import 'package:smart_alert_demo_flutter/widgets/main_pages/login_page.dart'
    as _i5;
import 'package:smart_alert_demo_flutter/widgets/main_pages/my_progress_page.dart'
    as _i2;
import 'package:smart_alert_demo_flutter/widgets/main_pages/profile_page.dart'
    as _i4;
import 'package:smart_alert_demo_flutter/widgets/main_pages/team_page.dart'
    as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    MyProgress.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyProgress());
    },
    Team.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Team());
    },
    ProfileRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.ProfilePage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.LoginPage(
              key: args.key, emailDefaultValue: args.emailDefaultValue));
    },
    ForgetPasswordWidget.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.ForgetPasswordWidget());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        _i7.RouteConfig(MyProgress.name, path: '/me', guards: [authGuard]),
        _i7.RouteConfig(Team.name, path: '/team', guards: [authGuard]),
        _i7.RouteConfig(ProfileRoute.name,
            path: '/profile', guards: [authGuard]),
        _i7.RouteConfig(LoginRoute.name, path: '/login'),
        _i7.RouteConfig(ForgetPasswordWidget.name, path: '/forgot-password')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.MyProgress]
class MyProgress extends _i7.PageRouteInfo<void> {
  const MyProgress() : super(MyProgress.name, path: '/me');

  static const String name = 'MyProgress';
}

/// generated route for
/// [_i3.Team]
class Team extends _i7.PageRouteInfo<void> {
  const Team() : super(Team.name, path: '/team');

  static const String name = 'Team';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i8.Key? key, String? emailDefaultValue})
      : super(LoginRoute.name,
            path: '/login',
            args:
                LoginRouteArgs(key: key, emailDefaultValue: emailDefaultValue));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.emailDefaultValue});

  final _i8.Key? key;

  final String? emailDefaultValue;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, emailDefaultValue: $emailDefaultValue}';
  }
}

/// generated route for
/// [_i6.ForgetPasswordWidget]
class ForgetPasswordWidget extends _i7.PageRouteInfo<void> {
  const ForgetPasswordWidget()
      : super(ForgetPasswordWidget.name, path: '/forgot-password');

  static const String name = 'ForgetPasswordWidget';
}
