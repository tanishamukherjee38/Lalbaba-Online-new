// Application navigation configuration.
// Why: Define and manage all application routes in one centralized place.
import 'package:go_router/go_router.dart';

import '../../features/dashboard/pages/bottom_nav_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/widgets/appdrawer_widget.dart';
import '../../webView/lalbabaWebView.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.bottomnavigation,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.web_splash,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(path: RouteNames.home, builder: (_, __) => const HomePage()),
    GoRoute(
      path: RouteNames.bottomnavigation,
      builder: (_, __) => const NavigationPage(),
    ),
    GoRoute(
      path: RouteNames.account,
      builder: (_, __) => const AccountPage(
        userName: 'John Doe',
        userEmail: 'john.doe@example.com',
      ),
    ),

    //  GoRoute(path: RouteNames.home, builder: (_, __) => const H()),
  ],
);
