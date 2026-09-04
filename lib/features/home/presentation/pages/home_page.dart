// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';
// import '../widgets/appbar_widget.dart';

// import '../widgets/bestseller_widget.dart';

// import '../widgets/category_widget.dart';

// import '../widgets/popularsearch_widget.dart';
// import '../widgets/search_widget.dart';
// import '../widgets/trandingproduct_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _cartCount = 0;

//   // ---- Dummy data (replace with API data via your ApiService) ----
//   // No model classes used — plain lists / maps only.

//   final List<String> _categoryNames = ['Rice', 'Spices'];
//   final List<IconData> _categoryIcons = [
//     Icons.rice_bowl_outlined,
//     Icons.blender_outlined,
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       appBar: LalBabaAppBar(
//         cartCount: _cartCount,
//         onCartTap: () {
//           // TODO: navigate to cart page
//         },
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(top: 12, bottom: 16),
//         children: [
//           SearchWidget(
//             onChanged: (query) {
//               // TODO: hook up search
//             },
//           ),
//           const SizedBox(height: 16),
//           CategoryWidget(
//             names: _categoryNames,
//             icons: _categoryIcons,
//             onCategoryTap: (name) {
//               // TODO: navigate to category listing page
//             },
//           ),
//           const SizedBox(height: 8),
//           TrendingWidget(
//             products: _trendingProducts,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full trending list
//             },
//           ),
//           PopularSearchWidget(
//             products: _popularSearch,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//           ),
//           BestSellerWidget(
//             products: _bestSellers,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full best-seller list
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';
// import '../widgets/appbar_widget.dart';

// import '../widgets/bestseller_widget.dart';

// import '../widgets/category_widget.dart';

// import '../widgets/popularsearch_widget.dart';
// import '../widgets/search_widget.dart';
// import '../widgets/trandingproduct_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _cartCount = 0;

  
//   final List<String> _categoryNames = ['For You', 'Rice', 'Spices','For You', 'Rice', 'Spices'];

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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       appBar: LalBabaAppBar(
//         cartCount: _cartCount,
//         onCartTap: () {
//           // TODO: navigate to cart page
//         },
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(top: 12, bottom: 16),
//         children: [
//           SearchWidget(
//             onChanged: (query) {
//               // TODO: hook up search
//             },
//           ),
//           const SizedBox(height: 16),
//           CategoryWidget(
//             names: _categoryNames,
//             onCategoryTap: (name) {
//               // TODO: navigate to category listing page
//             },
//           ),
//           const SizedBox(height: 8),
//           TrendingWidget(
//             products: _trendingProducts,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full trending list
//             },
//           ),
//           PopularSearchWidget(
//             products: _popularSearch,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//           ),
//           BestSellerWidget(
//             products: _bestSellers,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full best-seller list
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';
// import '../widgets/appbar_widget.dart';
// import '../widgets/bestseller_widget.dart';
// import '../widgets/category_widget.dart';
// import '../widgets/popularsearch_widget.dart';
// import '../widgets/search_widget.dart';
// import '../widgets/trandingproduct_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _cartCount = 0;

//   // Category images/avatars are defined inside CategoryWidget itself
//   // (index-matched with this names list), so only names are passed
//   // from here.
//   final List<String> _categoryNames = ['For You', 'Rice', 'Spices'];

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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       appBar: LalBabaAppBar(
//         cartCount: _cartCount,
//         onCartTap: () {
//           // TODO: navigate to cart page
//         },
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(top: 12, bottom: 16),
//         children: [
//           SearchWidget(
//             onChanged: (query) {
//               // TODO: hook up search
//             },
//           ),
//           const SizedBox(height: 16),
//           CategoryWidget(
//             names: _categoryNames,
//             onCategoryTap: (name) {
//               // TODO: navigate to category listing page
//             },
//           ),
//           const SizedBox(height: 8),
//           TrendingWidget(
//             products: _trendingProducts,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full trending list
//             },
//           ),
//           PopularSearchWidget(
//             products: _popularSearch,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//           ),
//           BestSellerWidget(
//             products: _bestSellers,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full best-seller list
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';
// import '../widgets/appbar_widget.dart';
// import '../widgets/banner_widget.dart';
// import '../widgets/bestseller_widget.dart';
// import '../widgets/category_widget.dart';
// import '../widgets/popularsearch_widget.dart';
// import '../widgets/search_widget.dart';
// import '../widgets/trandingproduct_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _cartCount = 0;

//   // Category images/avatars are defined inside CategoryWidget itself
//   // (index-matched with this names list), so only names are passed
//   // from here.
//   final List<String> _categoryNames = ['For You', 'Rice', 'Spices'];

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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       appBar: LalBabaAppBar(
//         cartCount: _cartCount,
//         onCartTap: () {
//           // TODO: navigate to cart page
//         },
//       ),
//       body: ListView(
//         padding: const EdgeInsets.only(top: 12, bottom: 16),
//         children: [
//           SearchWidget(
//             onChanged: (query) {
//               // TODO: hook up search
//             },
//           ),
//           const SizedBox(height: 16),
//           CategoryWidget(
//             names: _categoryNames,
//             onCategoryTap: (name) {
//               // TODO: navigate to category listing page
//             },
//           ),
//           const SizedBox(height: 16),
//           BannerWidget(
//             onBannerTap: (index) {
//               // TODO: navigate to the relevant offer/category page
//             },
//           ),
//           const SizedBox(height: 8),
//           TrendingWidget(
//             products: _trendingProducts,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full trending list
//             },
//           ),
//           PopularSearchWidget(
//             products: _popularSearch,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//           ),
//           BestSellerWidget(
//             products: _bestSellers,
//             onProductTap: (product) {
//               // TODO: navigate to product details page
//             },
//             onViewAllTap: () {
//               // TODO: navigate to full best-seller list
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../account/presentation/widgets/app_string.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/popularsearch_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 16),
        children: [
          SearchWidget(
            onChanged: (query) {
              // TODO: hook up search
            },
          ),
          const SizedBox(height: 16),
          CategoryWidget(
            names: _categoryNames,
            onCategoryTap: (name) {
              // TODO: navigate to category listing page
            },
          ),
          const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}
