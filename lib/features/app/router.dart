import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pt_maha_akbar/features/home/presentation/screen/home_screen.dart';

class MainRouter {
  generateRoute() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => MaterialPage(child: const HomeScreen()),
        )
      ],
    );
  }
}
