

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _notificationCount = 0;

  // Category images/avatars are defined inside CategoryWidget itself
  // (index-matched with this names list), so only names are passed
  // from here.
  final List<String> _categoryNames = ['For You', 'Rice', 'Spices'];

  final List<Map<String, dynamic>> _trendingProducts = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'originalPrice': '₹1,299.00',
      'discountLabel': '16% off',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati Steam',
      'imageUrl': AssetConstants.basmoti,
      'price': '₹230.00',
      'originalPrice': '₹270.00',
      'discountLabel': '15% off',
      'rating': 4.5,
    },
    {
      'name': 'Lalbaba Jeer Rice',
      'imageUrl': AssetConstants.jeerrice,
      'price': '₹650.00',
      'rating': 4.7,
    },
  ];

  final List<Map<String, dynamic>> _popularSearch = [
    {
      'name': 'Minikit',
      'imageUrl': AssetConstants.miniket1,
      'discountLabel': '10%',
    },
    {
      'name': 'Ratna Basmati',
      'imageUrl': AssetConstants.ratna,
      'discountLabel': '20%',
    },
  ];

  final List<Map<String, dynamic>> _bestSellers = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'originalPrice': '₹1,299.00',
      'discountLabel': '16% off',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati',
      'imageUrl': AssetConstants.baskati,
      'price': '₹230.00',
      'originalPrice': '₹275.00',
      'discountLabel': '16% off',
      'rating': 4.5,
    },
    {
      'name': 'Lalbaba Jeer Rice',
      'imageUrl': AssetConstants.jeerrice,
      'price': '₹650.00',
      'originalPrice': '₹750.00',
      'discountLabel': '13% off',
      'rating': 4.6,
    },
  ];

  // Add to Cart taps bump the notification badge count (1, 2, 3...)
  // shown on the bell icon in the app bar.
  void _handleAddToCart(Map<String, dynamic> product) {
    setState(() {
      _notificationCount++;
    });
  }

  // Pull-to-refresh handler. Replace the delay with real data
  // fetching (API calls) whenever this page is wired up to a
  // backend — the RefreshIndicator spinner shows for as long as
  // this future takes to complete.
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 900));
    // TODO: re-fetch categories / banners / products / etc. here
    // and setState with the new data once available.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,

        appBar: LalBabaAppBar(
          notificationCount: _notificationCount,
          onNotificationTap: () {
            // TODO: navigate to notifications page
          },
          onCartTap: () {
            // TODO: navigate to cart page
          },
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          color: AppColors.error,
          // Platform-default physics — BouncingScrollPhysics (iOS
          // style) stops RefreshIndicator from detecting the
          // overscroll correctly on Android, which is why the
          // loader wasn't showing up right.
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // ─────────────────────────
              // SEARCH — scrolls away normally
              // ─────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 16),
                  child: SearchWidget(
                    onChanged: (query) {
                      // TODO: hook up search
                    },
                  ),
                ),
              ),

              // ─────────────────────────
              // CATEGORY — pinned right below the app bar;
              // stays fixed while everything else (including
              // search) scrolls underneath it.
              // ─────────────────────────
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  height: _categoryHeight,
                  child: CategoryWidget(
                    names: _categoryNames,
                    onCategoryTap: (name) {
                      // TODO: navigate to category listing page
                    },
                  ),
                ),
              ),

              // ─────────────────────────
              // EVERYTHING ELSE — scrolls under the pinned
              // category bar.
              // ─────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: [
                      BannerWidget(
                        onBannerTap: (index) {
                          // TODO: navigate to the relevant offer/category page
                        },
                      ),
                      const SizedBox(height: 8),

                      // ─────────────────────────
                      // TRENDING THIS WEEK
                      // ─────────────────────────
                      SectionCardWidget(
                        title: AppStrings.trendingThisWeek,
                        products: _trendingProducts,
                        onProductTap: (product) {
                          // TODO: navigate to product details page
                        },
                        onAddToCart: _handleAddToCart,
                        onViewAllTap: () {
                          // TODO: navigate to full trending list
                        },
                      ),

                      PopularSearchWidget(
                        products: _popularSearch,
                        onProductTap: (product) {
                          // TODO: navigate to product details page
                        },
                      ),

                      // ─────────────────────────
                      // ALL TIME BEST SELLER
                      // ─────────────────────────
                      SectionCardWidget(
                        title: AppStrings.bestSeller,
                        products: _bestSellers,
                        onProductTap: (product) {
                          // TODO: navigate to product details page
                        },
                        onAddToCart: _handleAddToCart,
                        onViewAllTap: () {
                          // TODO: navigate to full best-seller list
                        },
                      ),

                      const SizedBox(height: 8),

                      // ─────────────────────────
                      // RECIPES
                      // ─────────────────────────
                      RecipeWidget(
                        onRecipeTap: (index) {
                          // TODO: navigate to the recipe details page
                        },
                      ),

                      const SizedBox(height: 24),

                      // ─────────────────────────
                      // HAPPY HOME CHEFS (customer reviews)
                      // ─────────────────────────
                      TestimonialWidget(
                        onReviewTap: (index) {
                          // TODO: navigate to the full review / details page
                        },
                      ),
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

  // Matches CategoryWidget's own fixed height.
  static const double _categoryHeight = 60;
}

/// Pins `child` at a fixed height as a sliver so it stays put right
/// below the app bar while the rest of the page scrolls underneath
/// it — used here to keep CategoryWidget visible at all times.
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
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
      shadowColor: Colors.black.withOpacity(0.08),
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }
}
