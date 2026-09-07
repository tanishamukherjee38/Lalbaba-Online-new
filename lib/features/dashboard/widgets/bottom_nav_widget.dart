import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../account/presentation/widgets/app_string.dart';

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

class _NotchClipper extends CustomClipper<Path> {
  final double notchRadius;
  final double notchMargin;
  final double notchDepth;
  final double topCornerRadius;

  const _NotchClipper({
    required this.notchRadius,
    required this.notchDepth,
    this.notchMargin = 8,
    this.topCornerRadius = 22,
  });

  @override
  Path getClip(Size size) {
    final double centerX = size.width / 2;
    final double r = notchRadius + notchMargin;
    final double curveWidth = r * 1.6;

    final path = Path()
      ..moveTo(0, topCornerRadius)
      ..quadraticBezierTo(0, 0, topCornerRadius, 0)
      ..lineTo(centerX - curveWidth, 0)
      ..cubicTo(
        centerX - curveWidth * 0.55, 0,
        centerX - r, notchDepth,
        centerX, notchDepth,
      )
      ..cubicTo(
        centerX + r, notchDepth,
        centerX + curveWidth * 0.55, 0,
        centerX + curveWidth, 0,
      )
      ..lineTo(size.width - topCornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, topCornerRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant _NotchClipper oldClipper) {
    return oldClipper.notchRadius != notchRadius ||
        oldClipper.notchDepth != notchDepth ||
        oldClipper.notchMargin != notchMargin ||
        oldClipper.topCornerRadius != topCornerRadius;
  }
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

  static const double _cartGap = 10.0;
  static const double _liftAmount = 6.0;
  static const double _heightScale = 0.82;
  static const double _fabSinkFraction = 0.5;
  static const double _notchMargin = 8.0;
  static const double _topCornerRadius = 22.0;

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
    required NavItemData data,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final Color color = isSelected ? AppColors.primary : AppColors.grey;

    return SizedBox(
      width: itemWidth,
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: isSelected ? 1 : 0,
                  child: Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  tween: Tween(begin: 1.0, end: isSelected ? 1.08 : 1.0),
                  builder: (context, scale, child) => Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                  child: Icon(
                    isSelected ? data.activeIcon : data.icon,
                    color: color,
                    size: AppSizes.iconMedium,
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
      ),
    );
  }

  Widget _buildCartLabelSlot({
    required double itemWidth,
    required bool isSelected,
    required double fabSinkHeight,
  }) {
    return SizedBox(
      width: itemWidth,
      child: GestureDetector(
        onTap: () => onTap(cartIndex),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: SizedBox(height: fabSinkHeight + _cartGap),
            ),
            SizedBox(height: AppSizes.spacingXXSmall),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isCartSelected = currentIndex == cartIndex;

    final double navBarHeight = AppSizes.bottomNavHeight * _heightScale;
    final double fabSize = AppSizes.fabSize;
    final double fabSinkHeight = fabSize * _fabSinkFraction;
    final double bottomInset = MediaQuery.paddingOf(context).bottom;

    final double stackHeight =
        navBarHeight + bottomInset + fabSinkHeight + _liftAmount;

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
            Positioned.fill(
              child: ClipPath(
                clipper: _NotchClipper(
                  notchRadius: fabSize / 2,
                  notchDepth: fabSinkHeight,
                  notchMargin: _notchMargin,
                  topCornerRadius: _topCornerRadius,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.10),
                        blurRadius: 20,
                        spreadRadius: -2,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: fabSinkHeight),
                      SizedBox(
                        height: navBarHeight,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double itemWidth =
                                constraints.maxWidth / 5;

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _buildNavItem(
                                  itemWidth: itemWidth,
                                  data: _sideItems[0],
                                  isSelected: currentIndex == 0,
                                  onTap: () => onTap(0),
                                ),
                                _buildNavItem(
                                  itemWidth: itemWidth,
                                  data: _sideItems[1],
                                  isSelected: currentIndex == 1,
                                  onTap: () => onTap(1),
                                ),
                                _buildCartLabelSlot(
                                  itemWidth: itemWidth,
                                  isSelected: isCartSelected,
                                  fabSinkHeight: fabSinkHeight,
                                ),
                                _buildNavItem(
                                  itemWidth: itemWidth,
                                  data: _sideItems[2],
                                  isSelected: currentIndex == 3,
                                  onTap: () => onTap(3),
                                ),
                                _buildNavItem(
                                  itemWidth: itemWidth,
                                  data: _sideItems[3],
                                  isSelected: currentIndex == 4,
                                  onTap: () => onTap(4),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: bottomInset + _liftAmount),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () => onTap(cartIndex),
                child: Container(
                  width: fabSize,
                  height: fabSize,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary,
                        Color.lerp(AppColors.primary, Colors.black, 0.15)!,
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.background,
                      width: AppSizes.spacingXXSmall,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.35),
                        blurRadius: 14,
                        spreadRadius: 0,
                        offset: const Offset(0, 5),
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
