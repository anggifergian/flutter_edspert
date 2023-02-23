import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/final_project/error/error_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_edspert/views/final_project/login/login.dart';
import 'package:flutter_edspert/views/final_project/home/home_final_project.dart';

final GoRouter routes =
    GoRouter(routes: routesBuilder, errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()));

final List<GoRoute> routesBuilder = [
  GoRoute(path: '/', name: 'Home', builder: (context, state) => const HomeFinalProject()),
  GoRoute(path: '/login', name: 'Login', builder: (context, state) => const LoginView())
];
