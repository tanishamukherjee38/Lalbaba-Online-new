

// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';
// import '../../../account/presentation/widgets/app_string.dart';
// import '../widgets/appbar_widget.dart';
// import '../widgets/banner_widget.dart';
// import '../widgets/category_widget.dart';
// import '../widgets/homechefs_widget.dart';
// import '../widgets/popularsearch_widget.dart';
// import '../widgets/recipe_widget.dart';
// import '../widgets/search_widget.dart';
// import '../widgets/sectioncard_widget.dart';

// import '../../../product/presentation/pages/product_list_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // ================================================================
//   // CART / NOTIFICATION COUNT
//   // ================================================================

//   int _notificationCount = 0;

//   final List<String> _categoryNames = [
//     'For You',
//     'Rice',
//     'Spices',
//   ];

//   final List<Map<String, dynamic>> _trendingProducts = [
//     {
//       'name': 'Lalbaba Superior Minikit',
//       'imageUrl': AssetConstants.miniket,
//       'price': '₹1,089.00',
//       'originalPrice': '₹1,299.00',
//       'discountLabel': '16% off',
//       'rating': 5.0,
//     },
//     {
//       'name': 'Lalbaba Basmati Steam',
//       'imageUrl': AssetConstants.basmoti,
//       'price': '₹230.00',
//       'originalPrice': '₹270.00',
//       'discountLabel': '15% off',
//       'rating': 4.5,
//     },
//     {
//       'name': 'Lalbaba Jeer Rice',
//       'imageUrl': AssetConstants.jeerrice,
//       'price': '₹650.00',
//       'rating': 4.7,
//     },
//   ];

//   final List<Map<String, dynamic>> _popularSearch = [
//     {
//       'name': 'Minikit',
//       'imageUrl': AssetConstants.miniket1,
//       'discountLabel': '10%',
//     },
//     {
//       'name': 'Ratna Basmati',
//       'imageUrl': AssetConstants.ratna,
//       'discountLabel': '20%',
//     },
//   ];

//   final List<Map<String, dynamic>> _bestSellers = [
//     {
//       'name': 'Lalbaba Superior Minikit',
//       'imageUrl': AssetConstants.miniket,
//       'price': '₹1,089.00',
//       'originalPrice': '₹1,299.00',
//       'discountLabel': '16% off',
//       'rating': 5.0,
//     },
//     {
//       'name': 'Lalbaba Basmati',
//       'imageUrl': AssetConstants.baskati,
//       'price': '₹230.00',
//       'originalPrice': '₹275.00',
//       'discountLabel': '16% off',
//       'rating': 4.5,
//     },
//     {
//       'name': 'Lalbaba Jeer Rice',
//       'imageUrl': AssetConstants.jeerrice,
//       'price': '₹650.00',
//       'originalPrice': '₹750.00',
//       'discountLabel': '13% off',
//       'rating': 4.6,
//     },
//   ];

//   // ================================================================
//   // OPEN PRODUCT LIST PAGE
//   // ================================================================

//   Future<void> _openProductListPage() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => ProductListPage(
//           // ========================================================
//           // CURRENT HOME COUNT PRODUCT LIST-E PATHANO HOCHE
//           // ========================================================

//           initialCartCount: _notificationCount,

//           // ========================================================
//           // PRODUCT LIST THEKE ADD HOLE
//           // SATHE SATHE HOME COUNT UPDATE HOBE
//           // ========================================================

//           onCartCountChanged: (count) {
//             if (!mounted) return;

//             setState(() {
//               _notificationCount = count;
//             });
//           },
//         ),
//       ),
//     );

//     if (!mounted) return;

//     // ==============================================================
//     // PRODUCT LIST THEKE BACK KORAR SOMOY
//     // FINAL COUNT RECEIVE
//     // ==============================================================

//     if (result is int) {
//       setState(() {
//         _notificationCount = result;
//       });
//     }
//   }

//   // ================================================================
//   // HOME PAGE PRODUCT ADD TO CART
//   // ================================================================

//   void _handleAddToCart(
//     Map<String, dynamic> product,
//   ) {
//     setState(() {
//       _notificationCount++;
//     });
//   }

//   // ================================================================
//   // REFRESH
//   // ================================================================

//   Future<void> _handleRefresh() async {
//     await Future.delayed(
//       const Duration(milliseconds: 900),
//     );

//     // TODO:
//     // re-fetch categories / banners / products / etc.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.background,

//         // ==========================================================
//         // APP BAR
//         // ==========================================================

//         appBar: LalBabaAppBar(
//           // ========================================================
//           // PRODUCT ADD TO CART COUNT
//           // ========================================================

//           notificationCount: _notificationCount,

//           onNotificationTap: () {
//             // TODO: navigate to notifications page
//           },

//           onCartTap: () {
//             // TODO: navigate to cart page
//           },
//         ),

//         // ==========================================================
//         // BODY
//         // ==========================================================

//         body: RefreshIndicator(
//           onRefresh: _handleRefresh,
//           color: AppColors.error,
//           child: CustomScrollView(
//             physics:
//                 const AlwaysScrollableScrollPhysics(),
//             slivers: [
//               // ====================================================
//               // SEARCH
//               // ====================================================

//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 12,
//                     bottom: 16,
//                   ),
//                   child: SearchWidget(
//                     onChanged: (query) {
//                       // TODO: hook up search
//                     },
//                   ),
//                 ),
//               ),

//               // ====================================================
//               // STICKY CATEGORY
//               // ====================================================

//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate:
//                     _StickyHeaderDelegate(
//                   height: _categoryHeight,
//                   child: CategoryWidget(
//                     names: _categoryNames,
//                     onCategoryTap: (name) {
//                       _openProductListPage();
//                     },
//                   ),
//                 ),
//               ),

//               // ====================================================
//               // EVERYTHING ELSE
//               // ====================================================

//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 16,
//                     bottom: 16,
//                   ),
//                   child: Column(
//                     children: [
//                       // ==================================================
//                       // BANNER
//                       // ==================================================

//                       BannerWidget(
//                         onBannerTap: (index) {
//                           // TODO:
//                           // navigate to relevant offer/category page
//                         },
//                       ),

//                       const SizedBox(height: 8),

//                       // ==================================================
//                       // TRENDING THIS WEEK
//                       // ==================================================

//                       SectionCardWidget(
//                         title:
//                             AppStrings.trendingThisWeek,
//                         products: _trendingProducts,

//                         onProductTap: (product) {
//                           // TODO:
//                           // navigate to product details page
//                         },

//                         onAddToCart:
//                             _handleAddToCart,

//                         onViewAllTap: () {
//                           _openProductListPage();
//                         },
//                       ),

//                       // ==================================================
//                       // POPULAR SEARCH
//                       // ==================================================

//                       PopularSearchWidget(
//                         products: _popularSearch,

//                         onProductTap: (product) {
//                           // TODO:
//                           // navigate to product details page
//                         },
//                       ),

//                       // ==================================================
//                       // ALL TIME BEST SELLER
//                       // ==================================================

//                       SectionCardWidget(
//                         title:
//                             AppStrings.bestSeller,
//                         products: _bestSellers,

//                         onProductTap: (product) {
//                           // TODO:
//                           // navigate to product details page
//                         },

//                         onAddToCart:
//                             _handleAddToCart,

//                         onViewAllTap: () {
//                           _openProductListPage();
//                         },
//                       ),

//                       const SizedBox(height: 8),

//                       // ==================================================
//                       // RECIPES
//                       // ==================================================

//                       RecipeWidget(
//                         onRecipeTap: (index) {
//                           // TODO:
//                           // navigate to recipe details page
//                         },
//                       ),

//                       const SizedBox(height: 24),

//                       // ==================================================
//                       // HAPPY HOME CHEFS
//                       // ==================================================

//                       TestimonialWidget(
//                         onReviewTap: (index) {
//                           // TODO:
//                           // navigate to full review / details page
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ================================================================
//   // CATEGORY HEIGHT
//   // ================================================================

//   static const double _categoryHeight = 60;
// }

// // ==================================================================
// // STICKY HEADER DELEGATE
// // ==================================================================

// class _StickyHeaderDelegate
//     extends SliverPersistentHeaderDelegate {
//   final double height;
//   final Widget child;

//   _StickyHeaderDelegate({
//     required this.height,
//     required this.child,
//   });

//   @override
//   double get minExtent => height;

//   @override
//   double get maxExtent => height;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Material(
//       color: Colors.white,
//       elevation: overlapsContent ? 2 : 0,
//       shadowColor:
//           Colors.black.withValues(alpha: 0.08),
//       child: child,
//     );
//   }

//   @override
//   bool shouldRebuild(
//     covariant _StickyHeaderDelegate oldDelegate,
//   ) {
//     return oldDelegate.height != height ||
//         oldDelegate.child != child;
//   }
// }



import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../account/presentation/widgets/app_string.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/homechefs_widget.dart';
import '../widgets/popularsearch_widget.dart';
import '../widgets/recipe_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/sectioncard_widget.dart';
import '../../../product/presentation/pages/product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _notificationCount = 0;

  final List<String> _categoryNames = [
    'For You',
    'Rice',
    'Spices',
  ];

  // ===========================================================================
  // TRENDING PRODUCTS
  // ===========================================================================

  final List<Map<String, dynamic>> _trendingProducts = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'originalPrice': '₹1,299.00',
      'discountLabel': '16% OFF',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati Steam',
      'imageUrl': AssetConstants.basmoti,
      'price': '₹230.00',
      'originalPrice': '₹270.00',
      'discountLabel': '15% OFF',
      'rating': 4.5,
    },
    {
      'name': 'Lalbaba Jeer Rice',
      'imageUrl': AssetConstants.jeerrice,
      'price': '₹650.00',
      'originalPrice': '',
      'discountLabel': '',
      'rating': 4.7,
    },
  ];

  // ===========================================================================
  // POPULAR SEARCH
  // ===========================================================================

  final List<Map<String, dynamic>> _popularSearch = [
    {
      'name': 'Minikit',
      'imageUrl': AssetConstants.miniket1,
      'discountLabel': '10% OFF',
    },
    {
      'name': 'Ratna Basmati',
      'imageUrl': AssetConstants.ratna,
      'discountLabel': '20% OFF',
    },
  ];

  // ===========================================================================
  // BEST SELLERS
  // ===========================================================================

  final List<Map<String, dynamic>> _bestSellers = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'originalPrice': '₹1,299.00',
      'discountLabel': '16% OFF',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati',
      'imageUrl': AssetConstants.baskati,
      'price': '₹230.00',
      'originalPrice': '₹275.00',
      'discountLabel': '16% OFF',
      'rating': 4.5,
    },
    {
      'name': 'Lalbaba Jeer Rice',
      'imageUrl': AssetConstants.jeerrice,
      'price': '₹650.00',
      'originalPrice': '₹750.00',
      'discountLabel': '13% OFF',
      'rating': 4.6,
    },
  ];

  // ===========================================================================
  // OPEN PRODUCT LIST PAGE
  // ===========================================================================

  Future<void> _openProductListPage({
    String? sectionType,
    String title = 'Products',
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListPage(
          initialCartCount: _notificationCount,

          onCartCountChanged: (count) {
            if (!mounted) return;

            setState(() {
              _notificationCount = count;
            });
          },

          sectionType: sectionType,
          pageTitle: title,
        ),
      ),
    );

    if (!mounted) return;

    if (result is int) {
      setState(() {
        _notificationCount = result;
      });
    }
  }

  // ===========================================================================
  // ADD TO CART
  // ===========================================================================

  void _handleAddToCart(
    Map<String, dynamic> product,
  ) {
    setState(() {
      _notificationCount++;
    });
  }

  // ===========================================================================
  // REFRESH
  // ===========================================================================

  Future<void> _handleRefresh() async {
    await Future.delayed(
      const Duration(
        milliseconds: 900,
      ),
    );

    // TODO:
    // Refetch categories
    // Refetch banners
    // Refetch products
  }

  @override
  Widget build(BuildContext context) {
    const double categoryHeight = 60;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,

        // =====================================================================
        // APP BAR
        // =====================================================================

        appBar: LalBabaAppBar(
          notificationCount: _notificationCount,

          onNotificationTap: () {
            // TODO: notification action
          },

          onCartTap: () {
            // TODO: cart action
          },
        ),

        // =====================================================================
        // BODY
        // =====================================================================

        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          color: AppColors.error,

          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),

            slivers: [
              // =================================================================
              // SEARCH
              // =================================================================

              const SliverToBoxAdapter(
                child: SearchWidget(),
              ),

              // =================================================================
              // STICKY CATEGORY
              // =================================================================

              SliverPersistentHeader(
                pinned: true,

                delegate: _StickyHeaderDelegate(
                  height: categoryHeight,

                  child: CategoryWidget(
                    names: _categoryNames,

                    onCategoryTap: (name) {
                      _openProductListPage();
                    },
                  ),
                ),
              ),

              // =================================================================
              // HOME CONTENT
              // =================================================================

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 20,
                  ),

                  child: Column(
                    children: [
                      // =========================================================
                      // BANNER
                      // =========================================================

                      const BannerWidget(),

                      // =========================================================
                      // TRENDING THIS WEEK
                      // =========================================================

                      SectionCardWidget(
                        title: AppStrings.trendingThisWeek,
                        products: _trendingProducts,

                        onProductTap: (product) {
                          // TODO: product details
                        },

                        onAddToCart: _handleAddToCart,

                        onViewAllTap: () {
                          _openProductListPage(
                            sectionType: 'trending',
                            title: 'Trending this week',
                          );
                        },
                      ),

                      // =========================================================
                      // POPULAR SEARCH
                      // =========================================================

                      PopularSearchWidget(
                        products: _popularSearch,
                      ),

                      // =========================================================
                      // BEST SELLER
                      // =========================================================

                      SectionCardWidget(
                        title: AppStrings.bestSeller,
                        products: _bestSellers,

                        onProductTap: (product) {
                          // TODO: product details
                        },

                        onAddToCart: _handleAddToCart,

                        onViewAllTap: () {
                          _openProductListPage(
                            sectionType: 'bestSeller',
                            title: 'All time Best seller',
                          );
                        },
                      ),

                      // =========================================================
                      // RECIPE
                      // =========================================================

                      const RecipeWidget(),

                      // =========================================================
                      // TESTIMONIAL
                      // =========================================================

                      const TestimonialWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==============================================================================
// STICKY HEADER DELEGATE
// ==============================================================================

class _StickyHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _StickyHeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: Colors.white,

      elevation: overlapsContent ? 2 : 0,

      shadowColor: Colors.black.withValues(
        alpha: 0.08,
      ),

      child: child,
    );
  }

  @override
  bool shouldRebuild(
    covariant _StickyHeaderDelegate oldDelegate,
  ) {
    return oldDelegate.height != height ||
        oldDelegate.child != child;
  }
}

