import 'package:flutter/material.dart';
import 'package:flutter_edspert/views/final_project/course/course_list.dart';
import 'package:flutter_edspert/views/final_project/exercise/exercise_list.dart';
import 'package:flutter_edspert/views/playground/orientation_builder/orientation_main_view.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_edspert/views/playground/router_go_vs_push/detail_screen.dart';
import 'package:flutter_edspert/views/playground/router_go_vs_push/modal_screen.dart';
import 'package:flutter_edspert/views/playground/router_go_vs_push/home_screen.dart';

final globalKey = GlobalKey<NavigatorState>();

final routesListPlayground = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) => DetailPage(
            id: state.params['id'].toString(),
          ),
        ),
        GoRoute(
          path: 'modal',
          pageBuilder: (context, state) {
            return const MaterialPage(
              fullscreenDialog: true,
              child: ModalPage(),
            );
          },
        ),
        GoRoute(
          path: 'courses',
          builder: (context, state) => const CourseList(),
          routes: [
            GoRoute(
              path: 'exercise',
              builder: (context, state) => ExerciseList(
                courseName: state.queryParams['courseName'],
                courseID: state.queryParams['courseID'],
              ),
            )
          ],
        ),
        GoRoute(
          path: 'orientation',
          builder: (context, state) => const OrientationMainView(),
        ),
      ],
    ),
  ],
);
