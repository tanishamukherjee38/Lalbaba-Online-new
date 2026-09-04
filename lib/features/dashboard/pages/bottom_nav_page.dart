import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cart/presentation/pages/cart_page.dart';
import '../../categories/presentation/pages/categories_page.dart';
import '../../account/presentation/widgets/account_widget.dart';
import '../../account/presentation/widgets/languange_constant.dart';
import '../controller/bottom_nav_controller.dart';
import '../widgets/bottom_nav_widget.dart';

import '../../home/presentation/pages/home_page.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  ConsumerState<NavigationPage> createState() {
    return _NavigationPageState();
  }
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    // Language change listen করবে
    return AnimatedBuilder(
      animation: AppLanguageConstants.instance,
      builder: (context, child) {
        final selectedIndex = ref.watch(bottomNavProvider);

        return Scaffold(
          body: selectedIndex == 0
              ? const HomePage()
              : selectedIndex == 1
              ? const CategoriesPage()
              : selectedIndex == 2
              ? const CartPage()
              : const AccountPage(),

          //const HomePage(),
          bottomNavigationBar: BottomNavWidget(
            currentIndex: selectedIndex,

            onTap: (index) {
              ref.read(bottomNavProvider.notifier).changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
