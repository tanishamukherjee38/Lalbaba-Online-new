// Application navigation configuration.
// Why: Define and manage all application routes in one centralized place.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/login', builder: (_, __) => const Scaffold()),
  ],
);
