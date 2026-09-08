import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
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

  static const int cartIndex = 2;

  // Bar height and FAB placement — tune these two numbers together:
  // smaller _heightScale = shorter bar. If you shrink it a lot and the
  // FAB starts crowding the icons, lower _fabOverlapFraction too (more of
  // the FAB will then sit above the bar instead of dipping into it).
  static const double _heightScale = 0.85;
  static const double _fabOverlapFraction = 0.55;
  static const double _fabClearanceGap = 6.0;

  // Bar surface color is hardcoded to plain white on purpose — matching
  // the reference UI exactly and removing any risk of a themed color
  // (like AppColors.background) carrying an unwanted tint.
  static const Color _barColor = Colors.white;

  List<NavItemData> get _sideItems => [
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
        NavItemData(
          icon: Icons.shopping_bag_outlined,
          activeIcon: Icons.shopping_bag,
          label: AppStrings.myOrders,
        ),
        NavItemData(
          icon: Icons.person_2_outlined,
          activeIcon: Icons.person_2,
          label: AppStrings.account,
        ),
      ];

  Widget _buildNavItem({
    required double itemWidth,
    required double iconSlotHeight,
    required NavItemData data,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final Color color = isSelected ? AppColors.primary : AppColors.grey;

    return SizedBox(
      width: itemWidth,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Every item's icon lives inside a slot of the SAME height
              // (iconSlotHeight) — this is what keeps every label, including
              // the cart's, aligned on one line.
              SizedBox(
                height: iconSlotHeight,
                child: Center(
                  child: Icon(
                    isSelected ? data.activeIcon : data.icon,
                    color: color,
                    size: AppSizes.iconMedium,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spacingXXSmall),
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
      ),
    );
  }

  Widget _buildCartLabelSlot({
    required double itemWidth,
    required double iconSlotHeight,
    required bool isSelected,
  }) {
    return SizedBox(
      width: itemWidth,
      child: InkWell(
        onTap: () => onTap(cartIndex),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Invisible placeholder — same height as the icon slot above,
              // and tall enough that the floating cart button (whose lowest
              // point is fixed by _fabClearanceGap) can never reach the text.
              SizedBox(height: iconSlotHeight),
              SizedBox(height: AppSizes.spacingXXSmall),
              Text(
                '${AppStrings.cart} ($cartCount)',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.grey,
                  fontSize: 12,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isCartSelected = currentIndex == cartIndex;

    final double navBarHeight = AppSizes.bottomNavHeight * _heightScale;
    final double fabSize = AppSizes.fabSize;
    final double fabOverlap = fabSize * _fabOverlapFraction; // portion above the bar
    final double fabVisibleInsideBar = fabSize - fabOverlap; // portion hanging into the bar
    final double bottomInset = MediaQuery.paddingOf(context).bottom;

    // Shared slot height used by every item (including the cart's
    // placeholder): big enough for a normal icon, AND big enough to clear
    // the part of the FAB that dips into the bar, plus a visible gap.
    final double iconSlotHeight = math.max(
      AppSizes.iconMedium,
      fabVisibleInsideBar + _fabClearanceGap,
    );

    final double stackHeight = navBarHeight + bottomInset + fabOverlap;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler:
            MediaQuery.textScalerOf(context).clamp(maxScaleFactor: 1.15),
      ),
      child: SizedBox(
        height: stackHeight,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // ==========================================================
            // FLAT WHITE BAR — colored ONLY where the bar actually is.
            // The space above it (where the FAB floats) is left fully
            // transparent so the page behind it just shows through as-is.
            // ==========================================================
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: _barColor,
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
                  child: SizedBox(
                    height: navBarHeight,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double itemWidth = constraints.maxWidth / 5;

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildNavItem(
                              itemWidth: itemWidth,
                              iconSlotHeight: iconSlotHeight,
                              data: _sideItems[0],
                              isSelected: currentIndex == 0,
                              onTap: () => onTap(0),
                            ),
                            _buildNavItem(
                              itemWidth: itemWidth,
                              iconSlotHeight: iconSlotHeight,
                              data: _sideItems[1],
                              isSelected: currentIndex == 1,
                              onTap: () => onTap(1),
                            ),
                            _buildCartLabelSlot(
                              itemWidth: itemWidth,
                              iconSlotHeight: iconSlotHeight,
                              isSelected: isCartSelected,
                            ),
                            _buildNavItem(
                              itemWidth: itemWidth,
                              iconSlotHeight: iconSlotHeight,
                              data: _sideItems[2],
                              isSelected: currentIndex == 3,
                              onTap: () => onTap(3),
                            ),
                            _buildNavItem(
                              itemWidth: itemWidth,
                              iconSlotHeight: iconSlotHeight,
                              data: _sideItems[3],
                              isSelected: currentIndex == 4,
                              onTap: () => onTap(4),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            // ==========================================================
            // FLOATING RED CART BUTTON — solid color circle, white ring,
            // floats above the bar. Matches the reference UI's cart icon.
            // ==========================================================
            Positioned(
              top: 0,
              child: InkWell(
                onTap: () => onTap(cartIndex),
                customBorder: const CircleBorder(),
                child: Container(
                  width: fabSize,
                  height: fabSize,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _barColor,
                      width: AppSizes.spacingXXSmall,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.20),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: AppSizes.iconLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}