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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:smart_alert_demo_flutter/routes/authentication_guard.dart'
    as _i12;
import 'package:smart_alert_demo_flutter/widgets/forget_password_widget.dart'
    as _i8;
import 'package:smart_alert_demo_flutter/widgets/main_pages/admin_page.dart'
    as _i5;
import 'package:smart_alert_demo_flutter/widgets/main_pages/home_page.dart'
    as _i1;
import 'package:smart_alert_demo_flutter/widgets/main_pages/login_page.dart'
    as _i7;
import 'package:smart_alert_demo_flutter/widgets/main_pages/my_progress_page.dart'
    as _i2;
import 'package:smart_alert_demo_flutter/widgets/main_pages/profile_page.dart'
    as _i4;
import 'package:smart_alert_demo_flutter/widgets/main_pages/sync_page.dart'
    as _i9;
import 'package:smart_alert_demo_flutter/widgets/main_pages/team_page.dart'
    as _i3;
import 'package:smart_alert_demo_flutter/widgets/main_pages/users_page.dart'
    as _i6;

class AppRouter extends _i10.RootStackRouter {
  AppRouter(
      {_i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    MyProgressRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MyProgressPage());
    },
    TeamRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.TeamPage());
    },
    ProfileRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.ProfilePage());
    },
    AdminRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.AdminPage());
    },
    UsersRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.UsersPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.LoginPage(
              key: args.key, emailDefaultValue: args.emailDefaultValue));
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ForgetPasswordPage());
    },
    SyncRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.SyncPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        _i10.RouteConfig(MyProgressRoute.name,
            path: '/me', guards: [authGuard]),
        _i10.RouteConfig(TeamRoute.name, path: '/team', guards: [authGuard]),
        _i10.RouteConfig(ProfileRoute.name,
            path: '/profile', guards: [authGuard]),
        _i10.RouteConfig(AdminRoute.name, path: '/admin', guards: [authGuard]),
        _i10.RouteConfig(UsersRoute.name, path: '/users', guards: [authGuard]),
        _i10.RouteConfig(LoginRoute.name, path: '/login'),
        _i10.RouteConfig(ForgetPasswordRoute.name, path: '/forgot-password'),
        _i10.RouteConfig(SyncRoute.name, path: '/sync')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.MyProgressPage]
class MyProgressRoute extends _i10.PageRouteInfo<void> {
  const MyProgressRoute() : super(MyProgressRoute.name, path: '/me');

  static const String name = 'MyProgressRoute';
}

/// generated route for
/// [_i3.TeamPage]
class TeamRoute extends _i10.PageRouteInfo<void> {
  const TeamRoute() : super(TeamRoute.name, path: '/team');

  static const String name = 'TeamRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.AdminPage]
class AdminRoute extends _i10.PageRouteInfo<void> {
  const AdminRoute() : super(AdminRoute.name, path: '/admin');

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i6.UsersPage]
class UsersRoute extends _i10.PageRouteInfo<void> {
  const UsersRoute() : super(UsersRoute.name, path: '/users');

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i11.Key? key, String? emailDefaultValue})
      : super(LoginRoute.name,
            path: '/login',
            args:
                LoginRouteArgs(key: key, emailDefaultValue: emailDefaultValue));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.emailDefaultValue});

  final _i11.Key? key;

  final String? emailDefaultValue;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, emailDefaultValue: $emailDefaultValue}';
  }
}

/// generated route for
/// [_i8.ForgetPasswordPage]
class ForgetPasswordRoute extends _i10.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: '/forgot-password');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i9.SyncPage]
class SyncRoute extends _i10.PageRouteInfo<void> {
  const SyncRoute() : super(SyncRoute.name, path: '/sync');

  static const String name = 'SyncRoute';
}
