// Application navigation configuration.
// Why: Define and manage all application routes in one centralized place.
import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/dashboard/pages/bottom_nav_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/widgets/account_widget.dart';
import '../../features/network/presentation/pages/no_internet_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/update/presentation/pages/update_page.dart';
import '../../webView/lalbabaWebView.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.bottomnavigation,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.web_splash,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),

    GoRoute(
      path: RouteNames.noInternet,
      builder: (context, state) {
        return const NoInternetPage();
      },
    ),

    GoRoute(
      path: RouteNames.update,
      builder: (context, state) {
        return const UpdatePage();
      },
    ),
    GoRoute(
      path: RouteNames.bottomnavigation,
      builder: (_, __) => const NavigationPage(),
    ),
    GoRoute(path: RouteNames.home, builder: (_, __) => const HomePage()),
    GoRoute(path: RouteNames.cart, builder: (_, __) => const CartPage()),
    GoRoute(
      path: RouteNames.categories,
      builder: (_, __) => const CategoriesPage(),
    ),
    GoRoute(path: RouteNames.account, builder: (_, __) => const AccountPage()),
  ],
);
