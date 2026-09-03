import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../home/presentation/widgets/app_string.dart';

class BottomNavWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,

            type: BottomNavigationBarType.fixed,

            backgroundColor: Colors.transparent,

            elevation: 0,

            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,

            selectedFontSize: 12,
            unselectedFontSize: 12,

            showSelectedLabels: true,
            showUnselectedLabels: true,

            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),

            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24),
                activeIcon: Icon(Icons.home, size: 24),
                label: AppStrings.home,
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.window_sharp, size: 24),
                activeIcon: Icon(Icons.window_sharp, size: 24),
                label: AppStrings.categories,
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 24),
                activeIcon: Icon(Icons.shopping_cart, size: 24),
                label: AppStrings.cart,
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24),
                activeIcon: Icon(Icons.person, size: 24),
                label: AppStrings.account,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
