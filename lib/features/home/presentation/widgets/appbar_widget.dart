// import 'package:flutter/material.dart';

// // LalBaba app bar.
// // Why: kept as its own PreferredSizeWidget so home_page.dart just does
// // `appBar: LalBabaAppBar(...)` and doesn't own any appbar layout logic.
// class LalBabaAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final int cartCount;
//   final VoidCallback? onCartTap;

//   const LalBabaAppBar({
//     super.key,
//     this.cartCount = 0,
//     this.onCartTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: const Color(0xFFE23F1C),
//       elevation: 0,
//       centerTitle: true,
//       // Builder is required here so Scaffold.of(context) can find the
//       // Scaffold that owns the Drawer (the AppBar itself is a sibling,
//       // not a descendant, of that Scaffold's context).
//       leading: Builder(
//         builder: (context) => IconButton(
//           icon: const Icon(Icons.menu, color: Colors.white),
//           onPressed: () => Scaffold.of(context).openDrawer(),
//         ),
//       ),
//       title: const Text(
//         'LalBaba',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 8),
//           child: InkWell(
//             onTap: onCartTap,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//                   child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
//                 ),
//                 if (cartCount > 0)
//                   Positioned(
//                     right: 2,
//                     top: 6,
//                     child: Container(
//                       padding: const EdgeInsets.all(3),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       constraints:
//                           const BoxConstraints(minWidth: 16, minHeight: 16),
//                       child: Text(
//                         '$cartCount',
//                         style: const TextStyle(
//                           color: Color(0xFFE23F1C),
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';

// class LalBabaAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final int cartCount;
//   final VoidCallback? onCartTap;

//   const LalBabaAppBar({
//     super.key,
//     this.cartCount = 0,
//     this.onCartTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColors.error,
//       elevation: 0,
//       centerTitle: true,
//       // Builder is required here so Scaffold.of(context) can find the
//       // Scaffold that owns the Drawer (the AppBar itself is a sibling,
//       // not a descendant, of that Scaffold's context).
//       leading: Builder(
//         builder: (context) => IconButton(
//           icon: const Icon(Icons.menu, color: AppColors.background),
//           onPressed: () => Scaffold.of(context).openDrawer(),
//         ),
//       ),
//       title: const Text(
//         'LalBaba',
//         style: TextStyle(
//           color: AppColors.background,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 8),
//           child: InkWell(
//             onTap: onCartTap,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//                   child: Icon(Icons.shopping_bag_outlined, color: AppColors.background),
//                 ),
//                 if (cartCount > 0)
//                   Positioned(
//                     right: 2,
//                     top: 6,
//                     child: Container(
//                       padding: const EdgeInsets.all(3),
//                       decoration: const BoxDecoration(
//                         color: AppColors.background,
//                         shape: BoxShape.circle,
//                       ),
//                       constraints:
//                           const BoxConstraints(minWidth: 16, minHeight: 16),
//                       child: Text(
//                         '$cartCount',
//                         style: const TextStyle(
//                           color: AppColors.error,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';

// class LalBabaAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final int cartCount;
//   final VoidCallback? onCartTap;

//   const LalBabaAppBar({
//     super.key,
//     this.cartCount = 0,
//     this.onCartTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColors.error,
//       elevation: 0,
//       centerTitle: true,

//       // Menu button
//       leading: Builder(
//         builder: (context) => IconButton(
//           icon: const Icon(
//             Icons.menu,
//             color: AppColors.background,
//           ),
//           onPressed: () => Scaffold.of(context).openDrawer(),
//         ),
//       ),

//       // Logo + LalBaba
//       title: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: Image.asset(
//               AssetConstants.logo,
//               width: 36,
//               height: 36,
//               fit: BoxFit.contain,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(
//                 Icons.rice_bowl,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           const Text(
//             'LalBaba',
//             style: TextStyle(
//               color: AppColors.background,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),

//       // Cart button
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 8),
//           child: InkWell(
//             onTap: onCartTap,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 12,
//                   ),
//                   child: Icon(
//                     Icons.shopping_bag_outlined,
//                     color: AppColors.background,
//                   ),
//                 ),

//                 if (cartCount > 0)
//                   Positioned(
//                     right: 2,
//                     top: 6,
//                     child: Container(
//                       padding: const EdgeInsets.all(3),
//                       decoration: const BoxDecoration(
//                         color: AppColors.background,
//                         shape: BoxShape.circle,
//                       ),
//                       constraints: const BoxConstraints(
//                         minWidth: 16,
//                         minHeight: 16,
//                       ),
//                       child: Text(
//                         '$cartCount',
//                         style: const TextStyle(
//                           color: AppColors.error,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

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
      // MENU BUTTON
      // ─────────────────────────────────────────────
      // leading: Builder(
      //   builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.only(left: 10),
      //       child: IconButton(
      //         tooltip: 'Menu',
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         style: IconButton.styleFrom(
      //           backgroundColor:
      //               AppColors.background.withOpacity(0.12),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //         ),
      //         icon: const Icon(
      //           Icons.menu_rounded,
      //           color: AppColors.background,
      //           size: 24,
      //         ),
      //       ),
      //     );
      //   },
      // ),

      // ─────────────────────────────────────────────
      // LOGO + BRAND
      // ─────────────────────────────────────────────
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42,
            height: 42,
            padding: const EdgeInsets.all(4),
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

        // Notification badge
        // if (notificationCount > 0)
        //   Positioned(
        //     right: -2,
        //     top: -4,
        //     child: Container(
        //       constraints: const BoxConstraints(minWidth: 19, minHeight: 19),
        //       padding: const EdgeInsets.symmetric(horizontal: 4),
        //       decoration: BoxDecoration(
        //         color: AppColors.background,
        //         shape: BoxShape.circle,
        //         border: Border.all(color: AppColors.error, width: 2),
        //       ),
        //       child: Center(
        //         child: Text(
        //           notificationCount > 99 ? '99+' : '$notificationCount',
        //           style: const TextStyle(
        //             color: AppColors.error,
        //             fontSize: 9,
        //             fontWeight: FontWeight.w800,
        //             height: 1,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
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
