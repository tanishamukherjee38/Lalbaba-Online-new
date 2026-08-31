// import 'package:flutter/material.dart';

// import '../../../../core/constants/asset_constants.dart';


// void main() {
//   runApp(const LalBabaApp());
// }

// class LalBabaApp extends StatelessWidget {
//   const LalBabaApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'LalBaba',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFFE23F1C),
//         scaffoldBackgroundColor: Colors.white,
//         fontFamily: 'Roboto',
//       ),
//       home: const LalBabaHomePage(),
//     );
//   }
// }

// /// ---------------- MODELS ----------------

// class ProductModel {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final double rating;

//   ProductModel({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     this.rating = 0,
//   });
// }

// class CategoryModel {
//   final String name;
//   final IconData icon;

//   CategoryModel({required this.name, required this.icon});
// }

// /// ---------------- HOME PAGE ----------------

// class LalBabaHomePage extends StatefulWidget {
//   const LalBabaHomePage({super.key});

//   @override
//   State<LalBabaHomePage> createState() => _LalBabaHomePageState();
// }

// class _LalBabaHomePageState extends State<LalBabaHomePage> {
//   int _selectedNavIndex = 0;
//   int _cartCount = 0;

//   // ---- Dummy data (replace with API data via your ApiService) ----
//   final List<CategoryModel> _categories = [
//     CategoryModel(name: 'Rice', icon: Icons.rice_bowl_outlined),
//     CategoryModel(name: 'Masala', icon: Icons.blender_outlined),
//   ];

//   final List<ProductModel> _trendingProducts = [
//     ProductModel(
//       name: 'Lalbaba Superior Minikit',
//       imageUrl: AssetConstants.miniket,
//       price: '₹1,089.00',
//       rating: 5,
//     ),
//     ProductModel(
//       name: 'Lalbaba Basmati Steam',
//       imageUrl: AssetConstants.basmoti,
//       price: '₹230.00',
//       rating: 4.5,
//     ),
//     ProductModel(
//       name: 'Lalbaba Jeer Rice',
//       imageUrl: AssetConstants.jeerrice,
//       price: '₹650.00',
//       rating: 4.7,
//     ),
//   ];

//   final List<ProductModel> _popularSearch = [
//     ProductModel(
//       name: 'Minikit',
//       imageUrl: AssetConstants.miniket1,
//       price: '',
//     ),
//     ProductModel(
//       name: 'Ratna Basmati',
//       imageUrl: AssetConstants.ratna,
//       price: '',
//     ),
//   ];

//   final List<ProductModel> _bestSellers = [
//     ProductModel(
//       name: 'Lalbaba Superior Minikit',
//       imageUrl: AssetConstants.miniket,
//       price: '₹1,089.00',
//       rating: 5,
//     ),
//     ProductModel(
//       name: 'Lalbaba Basmati',
//       imageUrl: AssetConstants.baskati,
//       price: '₹230.00',
//       rating: 4.5,
//     ),
//     ProductModel(
//       name: 'Lalbaba Jeer Rice',
//       imageUrl: AssetConstants.jeerrice,
//       price: '₹650.00',
//       rating: 4.6,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: _buildDrawer(),
//       appBar: _buildAppBar(),
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const SizedBox(height: 12),
//             _buildSearchBar(),
//             const SizedBox(height: 16),
//             _buildCategoryRow(),
//             const SizedBox(height: 8),
//             _buildSectionCard(
//               title: 'Trending this week',
//               products: _trendingProducts,
//               showPriceAndRating: true,
//             ),
//             const SizedBox(height: 16),
//             _buildPopularSearchCard(),
//             const SizedBox(height: 16),
//             _buildSectionCard(
//               title: 'All time Best seller',
//               products: _bestSellers,
//               showPriceAndRating: true,
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   /// ---------------- APP BAR ----------------

//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       backgroundColor: const Color(0xFFE23F1C),
//       elevation: 0,
//       centerTitle: true,
//       // left side hamburger -> opens Drawer automatically because we set `drawer:` above
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
//             onTap: () {
//               // TODO: navigate to cart page
//             },
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//                   child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
//                 ),
//                 if (_cartCount > 0)
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
//                         '$_cartCount',
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

//   /// ---------------- DRAWER (opens from left hamburger) ----------------

//   Widget _buildDrawer() {
//     return Drawer(
//       child: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               color: const Color(0xFFE23F1C),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(6),
//                     child: Image.asset(
//                       AssetConstants.logo,
//                       width: 36,
//                       height: 36,
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) =>
//                           const Icon(Icons.rice_bowl, color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'LalBaba',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.info_outline),
//               title: const Text('About Us'),
//               onTap: () {
//                 // TODO: navigate to About Us page
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.support_agent_outlined),
//               title: const Text('Support Policy'),
//               onTap: () {
//                 // TODO: navigate to Support Policy page
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.description_outlined),
//               title: const Text('Terms of Us'),
//               onTap: () {
//                 // TODO: navigate to Terms of Us page
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ---------------- SEARCH BAR ----------------

//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         height: 44,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade400),
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: const TextField(
//           decoration: InputDecoration(
//             hintText: 'Search for rice, masala...',
//             hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
//             prefixIcon: Icon(Icons.search, color: Colors.grey),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(vertical: 10),
//           ),
//         ),
//       ),
//     );
//   }

//   /// ---------------- CATEGORY ROW (Rice / Masala) ----------------

//   Widget _buildCategoryRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: _categories
//             .map(
//               (cat) => Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 56,
//                       height: 56,
//                       decoration: BoxDecoration(
//                         color: Colors.orange.shade50,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       child: Icon(cat.icon, color: const Color(0xFFE23F1C)),
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       cat.name,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }

//   /// ---------------- TRENDING / BEST SELLER CARD ----------------
//   /// (Same layout, only heading changes — as requested)

//   Widget _buildSectionCard({
//     required String title,
//     required List<ProductModel> products,
//     bool showPriceAndRating = false,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: showPriceAndRating ? 210 : 150,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: products.length,
//               separatorBuilder: (_, __) => const SizedBox(width: 12),
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return _buildProductCard(
//                   product,
//                   showPriceAndRating: showPriceAndRating,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductCard(
//     ProductModel product, {
//     bool showPriceAndRating = false,
//   }) {
//     return InkWell(
//       onTap: () {
//         // TODO: navigate to product details page
//       },
//       child: Container(
//         width: 130,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         clipBehavior: Clip.antiAlias,
//         // IMPORTANT: mainAxisSize.min so this Column never needs an
//         // unbounded/flexible parent height (fixes the RenderFlex crash).
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Fixed height instead of Expanded — Expanded only works when
//             // the parent gives a bounded height, which a Row/Column inside
//             // a ListView (shrink-wrapped) does NOT provide.
//             SizedBox(
//               height: 110,
//               width: double.infinity,
//               child: Container(
//                 color: Colors.grey.shade100,
//                 child: Image.network(
//                   product.imageUrl,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, progress) {
//                     if (progress == null) return child;
//                     return const Center(
//                       child: SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) => const Icon(
//                     Icons.image_outlined,
//                     size: 40,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//             if (showPriceAndRating)
//               Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.name,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                     const SizedBox(height: 2),
//                     if (product.rating > 0)
//                       Row(
//                         children: [
//                           const Icon(Icons.star,
//                               size: 12, color: Colors.orange),
//                           Text(
//                             ' ${product.rating}',
//                             style: const TextStyle(fontSize: 11),
//                           ),
//                         ],
//                       ),
//                     Text(
//                       product.price,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             else
//               Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Text(
//                   product.name,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ---------------- POPULAR SEARCH CARD (image-only, name below) ----------------

//   Widget _buildPopularSearchCard() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Popular Search',
//             style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: _popularSearch
//                 .map(
//                   (product) => Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: _buildProductCard(product),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ---------------- BOTTOM NAV BAR ----------------

//   Widget _buildBottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: _selectedNavIndex,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: const Color(0xFFE23F1C),
//       unselectedItemColor: Colors.grey,
//       onTap: (index) {
//         setState(() => _selectedNavIndex = index);
//         // TODO: navigate to respective page based on index
//       },
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined),
//           activeIcon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart_outlined),
//           activeIcon: Icon(Icons.shopping_cart),
//           label: 'Cart',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.receipt_long_outlined),
//           activeIcon: Icon(Icons.receipt_long),
//           label: 'My Order',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_outline),
//           activeIcon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../../core/constants/asset_constants.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/appdrawer_widget.dart';
import '../widgets/bestseller_widget.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/popularsearch_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/trandingproduct_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;
  int _cartCount = 0;

  // ---- Dummy data (replace with API data via your ApiService) ----
  // No model classes used — plain lists / maps only.

  final List<String> _categoryNames = ['Rice', 'Masala'];
  final List<IconData> _categoryIcons = [
    Icons.rice_bowl_outlined,
    Icons.blender_outlined,
  ];

  final List<Map<String, dynamic>> _trendingProducts = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati Steam',
      'imageUrl': AssetConstants.basmoti,
      'price': '₹230.00',
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
    },
    {
      'name': 'Ratna Basmati',
      'imageUrl': AssetConstants.ratna,
    },
  ];

  final List<Map<String, dynamic>> _bestSellers = [
    {
      'name': 'Lalbaba Superior Minikit',
      'imageUrl': AssetConstants.miniket,
      'price': '₹1,089.00',
      'rating': 5.0,
    },
    {
      'name': 'Lalbaba Basmati',
      'imageUrl': AssetConstants.baskati,
      'price': '₹230.00',
      'rating': 4.5,
    },
    {
      'name': 'Lalbaba Jeer Rice',
      'imageUrl': AssetConstants.jeerrice,
      'price': '₹650.00',
      'rating': 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(
        onAboutUsTap: () {
          // TODO: navigate to About Us page
        },
        onSupportPolicyTap: () {
          // TODO: navigate to Support Policy page
        },
        onTermsOfUsTap: () {
          // TODO: navigate to Terms of Us page
        },
      ),
      appBar: LalBabaAppBar(
        cartCount: _cartCount,
        onCartTap: () {
          // TODO: navigate to cart page
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 12),
            SearchWidget(
              onChanged: (query) {
                // TODO: hook up search
              },
            ),
            const SizedBox(height: 16),
            CategoryWidget(
              names: _categoryNames,
              icons: _categoryIcons,
              onCategoryTap: (name) {
                // TODO: navigate to category listing page
              },
            ),
            const SizedBox(height: 8),
            TrendingWidget(
              products: _trendingProducts,
              onProductTap: (product) {
                // TODO: navigate to product details page
              },
            ),
            const SizedBox(height: 16),
            PopularSearchWidget(
              products: _popularSearch,
              onProductTap: (product) {
                // TODO: navigate to product details page
              },
            ),
            const SizedBox(height: 16),
            BestSellerWidget(
              products: _bestSellers,
              onProductTap: (product) {
                // TODO: navigate to product details page
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() => _selectedNavIndex = index);
          // TODO: navigate to respective page based on index
        },
      ),
    );
  }
}
