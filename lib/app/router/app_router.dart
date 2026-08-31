// Application navigation configuration.
// Why: Define and manage all application routes in one centralized place.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lalbaba_online/features/home/presentation/pages/home_page.dart';
import 'package:lalbaba_online/webView/lalbabaWebView.dart';

import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.web_splash,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.web_splash,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(path: RouteNames.home, builder: (_, __) => const HomePage()),

    //  GoRoute(path: RouteNames.home, builder: (_, __) => const H()),
  ],
);
