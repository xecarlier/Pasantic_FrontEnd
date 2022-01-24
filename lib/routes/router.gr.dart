// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../screens/home/home.dart' as _i4;
import '../screens/login/login.dart' as _i2;
import '../screens/menu/internship_detail.dart' as _i5;
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
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(InternshipDetailRoute.name, path: '/internship')
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
