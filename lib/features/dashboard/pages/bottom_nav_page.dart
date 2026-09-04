import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cart/presentation/pages/cart_page.dart';
import '../../categories/presentation/pages/categories_page.dart';
import '../../account/presentation/widgets/account_widget.dart';
import '../../account/presentation/widgets/languange_constant.dart';
import '../../order/presentation/pages/order_details_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppLanguageConstants.instance,
      builder: (context, child) {
        final selectedIndex = ref.watch(bottomNavProvider);

        return Scaffold(
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
        );
      },
    );
  }
}