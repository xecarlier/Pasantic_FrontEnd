
import 'package:auto_route/auto_route.dart';
import 'package:sampleproject/screens/home/home.dart';
import 'package:sampleproject/screens/login/login.dart';
import 'package:sampleproject/screens/register/register.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Login, path: "/", initial: true),
  MaterialRoute(page: Register, path: "/register"),
  MaterialRoute(page: Home, path: "/home"),
])
class $AppRouter {}