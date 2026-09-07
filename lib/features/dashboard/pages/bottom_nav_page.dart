import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/app_colors.dart'; // <-- adjust path to your AppColors file
import '../../cart/presentation/pages/cart_page.dart';
import '../../categories/presentation/pages/categories_page.dart';
import '../../account/presentation/widgets/account_widget.dart';
import '../../account/presentation/widgets/languange_constant.dart';
import '../../order/presentation/pages/order_details_page.dart' hide AppColors;
import '../controller/bottom_nav_controller.dart';
import '../widgets/bottom_nav_widget.dart';

import '../../home/presentation/pages/home_page.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  ConsumerState<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  // Order must match BottomNavWidget: 0 Home, 1 Categories, 2 Cart, 3 Notifications, 4 More
  static final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const OrderDetailsPage(),
    const AccountPage(),
  ];

  // ── Back button ──────────────────────────────────────────────────────
  // If we're not on the Home tab, back just takes us to Home instead of
  // exiting. Only when already on Home does back show the exit dialog.
  Future<bool> _onBackPressed(int selectedIndex) async {
    if (selectedIndex != 0) {
      ref.read(bottomNavProvider.notifier).changeIndex(0);
      return false;
    }

    final bool exitApp =
        await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Exit App",
              style: TextStyle(color: AppColors.black),
            ),
            content: const Text(
              "Are you sure you want to exit this app?",
              style: TextStyle(color: AppColors.black),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  "No",
                  style: TextStyle(color: AppColors.black),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  "Yes",
                  style: TextStyle(color: AppColors.black),
                ),
              ),
            ],
          ),
        ) ??
        false;

    if (exitApp) SystemNavigator.pop();
    return exitApp;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppLanguageConstants.instance,
      builder: (context, child) {
        final selectedIndex = ref.watch(bottomNavProvider);

        return PopScope(
          // We always intercept the pop ourselves and decide what to do.
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            await _onBackPressed(selectedIndex);
            // When _onBackPressed returns true, SystemNavigator.pop()
            // has already been called inside it, so there's nothing
            // further to do here either way.
          },
          child: Scaffold(
            body: IndexedStack(
              index: selectedIndex,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavWidget(
              currentIndex: selectedIndex,
              cartCount: 0, // replace with your real cart count provider
              onTap: (index) {
                ref.read(bottomNavProvider.notifier).changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}