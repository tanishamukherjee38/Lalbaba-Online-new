import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../account/presentation/widgets/app_string.dart';

/// Simple data model for bottom navigation items.
class NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class BottomNavWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int cartCount;

  const BottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.cartCount = 0,
  });

  
  static final List<NavItemData> _sideItems = [
    NavItemData(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: AppStrings.home,
    ),

    NavItemData(
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
      label: AppStrings.categories,
    ),

    // Index 3 item
    NavItemData(
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
      label: AppStrings.trackOrders,
    ),

    NavItemData(
      icon: Icons.person_2_outlined,
      activeIcon: Icons.person_2,
      label: AppStrings.account,
    ),
  ];

  static Widget buildNavItem({
    required NavItemData data,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final Color color =
        isSelected ? AppColors.primary : AppColors.grey;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? data.activeIcon : data.icon,
              color: color,
              size: 24,
            ),

            const SizedBox(height: 4),

            Text(
              data.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const int cartIndex = 2;

    final bool isCartSelected = currentIndex == cartIndex;

    return SizedBox(
      height: 76,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [

          // ==========================================================
          // BOTTOM NAVIGATION BAR
          // ==========================================================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64,
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
                child: Row(
                  children: [

                    // ==================================================
                    // HOME - INDEX 0
                    // ==================================================
                    buildNavItem(
                      data: _sideItems[0],
                      isSelected: currentIndex == 0,
                      onTap: () => onTap(0),
                    ),

                    // ==================================================
                    // CATEGORIES - INDEX 1
                    // ==================================================
                    buildNavItem(
                      data: _sideItems[1],
                      isSelected: currentIndex == 1,
                      onTap: () => onTap(1),
                    ),

                    // ==================================================
                    // CENTER CART LABEL - INDEX 2
                    // ==================================================
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onTap(cartIndex),
                        behavior: HitTestBehavior.opaque,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // Space corresponding to normal nav icon.
                            // Actual cart icon is floating above.
                            const SizedBox(height: 24),

                            const SizedBox(height: 4),

                            Text(
                              '${AppStrings.cart} ($cartCount)',
                              maxLines: 1,
                              style: TextStyle(
                                color: isCartSelected
                                    ? AppColors.primary
                                    : AppColors.grey,
                                fontSize: 12,
                                fontWeight: isCartSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ==================================================
                    // INDEX 3
                    // ==================================================
                    buildNavItem(
                      data: _sideItems[2],
                      isSelected: currentIndex == 3,
                      onTap: () => onTap(3),
                    ),

                    // ==================================================
                    // ACCOUNT - INDEX 4
                    // ==================================================
                    buildNavItem(
                      data: _sideItems[3],
                      isSelected: currentIndex == 4,
                      onTap: () => onTap(4),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ==========================================================
          // FLOATING CART BUTTON
          // ==========================================================
          Positioned(
            // Negative value pushes cart slightly upward.
            top: -10,

            child: GestureDetector(
              onTap: () => onTap(cartIndex),

              child: Container(
                width: 56,
                height: 56,

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: AppColors.background,
                    width: 4,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.20),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}