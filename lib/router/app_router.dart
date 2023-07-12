
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_interview/modules/mydocmate/view/mydocmate_view.dart';
import 'package:flutter_interview/modules/mydocmate_history/view/mydocmate_view_history.dart';
/// The route configuration.
final appRouterConfig = GoRouter(
  routes: [
    GoRoute(
      name:'mydocmate-steps',
      path: '/',
      pageBuilder: (context, state){
        return const MaterialPage(child: MydocmateView());
      }
    ),
     GoRoute(
      name: 'mydocmate-history',
      path: '/history',
      pageBuilder: (context, state){
        return const MaterialPage(child: MydocmateViewHistory());
      }
    )
  ],
);
