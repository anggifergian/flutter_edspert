import 'package:go_router/go_router.dart';

class AppRouter {
  static const root = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
}

final routesFinal = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      routes: [GoRoute(path: 'dashboard')],
    ),
  ],
);
