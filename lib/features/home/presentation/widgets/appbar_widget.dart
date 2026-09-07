

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';

class LalBabaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int cartCount;
  final int notificationCount;

  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationTap;

  const LalBabaAppBar({
    super.key,
    this.cartCount = 0,
    this.notificationCount = 0,
    this.onCartTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.error,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: 12,

   
      // ─────────────────────────────────────────────
      // LOGO + BRAND
      // ─────────────────────────────────────────────
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42,
            height: 42,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                AssetConstants.logo,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.rice_bowl_rounded,
                    color: AppColors.error,
                    size: 27,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 10),

          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LalBaba',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Quality You Trust',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),

      // ─────────────────────────────────────────────
      // NOTIFICATION + CART
      // ─────────────────────────────────────────────
      actions: [
        // Notification
        _buildNotificationButton(),

        const SizedBox(width: 15),

        // // Cart
        // _buildCartButton(),

        // const SizedBox(width: 8),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // NOTIFICATION BUTTON
  // ─────────────────────────────────────────────
  Widget _buildNotificationButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          tooltip: 'Notifications',
          onPressed: onNotificationTap,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.background.withOpacity(0.12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: Badge(
            label: Text(notificationCount > 99 ? '99+' : '$notificationCount'),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.background,
              size: 28,
            ),
          ),
        ),

    
      ],
    );
  }

  // ─────────────────────────────────────────────
  // CART BUTTON
  // ─────────────────────────────────────────────
  Widget _buildCartButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          tooltip: 'Cart',
          onPressed: onCartTap,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.background.withOpacity(0.12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.background,
            size: 23,
          ),
        ),

        // Cart badge
        if (cartCount > 0)
          Positioned(
            right: -2,
            top: -4,
            child: Container(
              constraints: const BoxConstraints(minWidth: 19, minHeight: 19),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.error, width: 2),
              ),
              child: Center(
                child: Text(
                  cartCount > 99 ? '99+' : '$cartCount',
                  style: const TextStyle(
                    color: AppColors.error,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
