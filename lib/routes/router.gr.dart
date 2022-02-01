// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i9;

import '../screens/enterprise/enterprise.dart' as _i6;
import '../screens/friends/friend_profile.dart' as _i8;
import '../screens/home/home.dart' as _i4;
import '../screens/login/login.dart' as _i2;
import '../screens/menu/internship_detail.dart' as _i5;
import '../screens/rating.dart' as _i7;
import '../screens/register/register.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i2.Login());
    },
    RegisterRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i3.Register());
    },
    HomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: const _i4.Home());
    },
    InternshipDetailRoute.name: (entry) {
      var args = entry.routeData.argsAs<InternshipDetailRouteArgs>(
          orElse: () => InternshipDetailRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i5.InternshipDetail(id: args.id));
    },
    EnterpriseRoute.name: (entry) {
      var args = entry.routeData.argsAs<EnterpriseRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry, child: _i6.Enterprise(id: args.id, key: args.key));
    },
    RatingFormRoute.name: (entry) {
      var args = entry.routeData.argsAs<RatingFormRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child:
              _i7.RatingForm(reviewer: args.reviewer, ownerId: args.ownerId));
    },
    FriendProfileRoute.name: (entry) {
      var args = entry.routeData.argsAs<FriendProfileRouteArgs>(
          orElse: () => FriendProfileRouteArgs());
      return _i1.MaterialPageX(
          entry: entry, child: _i8.FriendProfile(id: args.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(InternshipDetailRoute.name, path: '/internship'),
        _i1.RouteConfig(EnterpriseRoute.name, path: '/internship/enterprise'),
        _i1.RouteConfig(RatingFormRoute.name, path: '/review'),
        _i1.RouteConfig(FriendProfileRoute.name, path: '/friend')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/');

  static const String name = 'LoginRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register');

  static const String name = 'RegisterRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class InternshipDetailRoute
    extends _i1.PageRouteInfo<InternshipDetailRouteArgs> {
  InternshipDetailRoute({int? id})
      : super(name,
            path: '/internship', args: InternshipDetailRouteArgs(id: id));

  static const String name = 'InternshipDetailRoute';
}

class InternshipDetailRouteArgs {
  const InternshipDetailRouteArgs({this.id});

  final int? id;
}

class EnterpriseRoute extends _i1.PageRouteInfo<EnterpriseRouteArgs> {
  EnterpriseRoute({required int id, _i9.Key? key})
      : super(name,
            path: '/internship/enterprise',
            args: EnterpriseRouteArgs(id: id, key: key));

  static const String name = 'EnterpriseRoute';
}

class EnterpriseRouteArgs {
  const EnterpriseRouteArgs({required this.id, this.key});

  final int id;

  final _i9.Key? key;
}

class RatingFormRoute extends _i1.PageRouteInfo<RatingFormRouteArgs> {
  RatingFormRoute({required int reviewer, required int ownerId})
      : super(name,
            path: '/review',
            args: RatingFormRouteArgs(reviewer: reviewer, ownerId: ownerId));

  static const String name = 'RatingFormRoute';
}

class RatingFormRouteArgs {
  const RatingFormRouteArgs({required this.reviewer, required this.ownerId});

  final int reviewer;

  final int ownerId;
}

class FriendProfileRoute extends _i1.PageRouteInfo<FriendProfileRouteArgs> {
  FriendProfileRoute({int? id})
      : super(name, path: '/friend', args: FriendProfileRouteArgs(id: id));

  static const String name = 'FriendProfileRoute';
}

class FriendProfileRouteArgs {
  const FriendProfileRouteArgs({this.id});

  final int? id;
}
