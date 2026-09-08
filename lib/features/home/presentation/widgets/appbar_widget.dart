

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';

/// ===============================================================
/// GLOBAL CART / NOTIFICATION COUNT
/// ===============================================================
///
/// App-er je kono page theke:
///
/// CartCountManager.add(1);
/// CartCountManager.add(2);
///
/// korle notification badge automatically update hobe.
///
/// Example:
///
/// CartCountManager.add(quantity);
///
/// ===============================================================

class CartCountManager {
  CartCountManager._();

  static final ValueNotifier<int> count =
      ValueNotifier<int>(0);

  /// Add item quantity
  static void add([int quantity = 1]) {
    if (quantity <= 0) return;

    count.value += quantity;
  }

  /// Remove item quantity
  static void remove([int quantity = 1]) {
    if (quantity <= 0) return;

    count.value =
        (count.value - quantity).clamp(0, 999999);
  }

  /// Set exact count
  static void setCount(int value) {
    count.value = value < 0 ? 0 : value;
  }

  /// Reset count
  static void clear() {
    count.value = 0;
  }

  /// Current count
  static int get currentCount => count.value;
}


/// ===============================================================
/// LALBABA APP BAR
/// ===============================================================

class LalBabaAppBar extends StatelessWidget
    implements PreferredSizeWidget {
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
    return ValueListenableBuilder<int>(
      valueListenable: CartCountManager.count,
      builder: (
        context,
        globalCount,
        child,
      ) {
        return AppBar(
          backgroundColor: AppColors.error,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 12,

          // =====================================================
          // LOGO + BRAND
          // =====================================================

          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 42,
                padding:
                    const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius:
                      BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withValues(alpha: 0.10),
                      blurRadius: 6,
                      offset:
                          const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(9),
                  child: Image.asset(
                    AssetConstants.logo,
                    fit: BoxFit.contain,
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
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
                mainAxisSize:
                    MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'LalBaba',
                    style: TextStyle(
                      color:
                          AppColors.background,
                      fontSize: 19,
                      fontWeight:
                          FontWeight.w700,
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
                      fontWeight:
                          FontWeight.w500,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // =====================================================
          // NOTIFICATION
          // =====================================================

          actions: [
            _buildNotificationButton(
              globalCount,
            ),

            const SizedBox(width: 8),

            // Cart button currently disabled
            // _buildCartButton(globalCount),

            const SizedBox(width: 8),
          ],
        );
      },
    );
  }

  // =============================================================
  // NOTIFICATION BUTTON
  // =============================================================

  Widget _buildNotificationButton(
    int globalCount,
  ) {
    return IconButton(
      tooltip: 'Notifications',
      onPressed: onNotificationTap,
      style: IconButton.styleFrom(
        backgroundColor:
            AppColors.background
                .withValues(alpha: 0.12),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12),
        ),
      ),
      icon: Badge(
        isLabelVisible: globalCount > 0,
        label: Text(
          globalCount > 99
              ? '99+'
              : '$globalCount',
        ),
        child: const Icon(
          Icons.notifications_none_rounded,
          color: AppColors.background,
          size: 28,
        ),
      ),
    );
  }

  // =============================================================
  // CART BUTTON
  // =============================================================

  /*
  Widget _buildCartButton(
    int globalCount,
  ) {
    return IconButton(
      tooltip: 'Cart',
      onPressed: onCartTap,
      style: IconButton.styleFrom(
        backgroundColor:
            AppColors.background
                .withValues(alpha: 0.12),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12),
        ),
      ),
      icon: Badge(
        isLabelVisible: globalCount > 0,
        label: Text(
          globalCount > 99
              ? '99+'
              : '$globalCount',
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.background,
          size: 27,
        ),
      ),
    );
  }
  */

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        kToolbarHeight,
      );
}