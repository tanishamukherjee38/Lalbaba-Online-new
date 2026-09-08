
// import 'package:flutter/material.dart';

// import '../../../../core/widgets/app_app_bar.dart';
// import '../../../home/presentation/widgets/appbar_widget.dart';

// class ProductListPage extends StatefulWidget {
//   final int initialCartCount;
//   final ValueChanged<int>? onCartCountChanged;

//   const ProductListPage({
//     super.key,
//     this.initialCartCount = 0,
//     this.onCartCountChanged,
//   });

//   @override
//   State<ProductListPage> createState() => _ProductListPageState();
// }

// class _ProductListPageState extends State<ProductListPage> {
//   // ================================================================
//   // CART
//   // ================================================================

//   late int cartCount;

//   // ================================================================
//   // FILTER
//   // ================================================================

//   RangeValues _priceRange = const RangeValues(119, 1649);

//   Set<String> _selectedCategories = {};
//   Set<String> _selectedWeights = {};

//   String _selectedSort = 'Default';

//   late List<ProductItem> _filteredProducts;

//   // ================================================================
//   // PRODUCTS
//   // ================================================================

//   final List<ProductItem> products = [
//     ProductItem(
//       name: 'Lalbaba Superior Banskathi',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/oAHc705alFhNrcljUs2QjIaemF95khJs5nisUpma.webp',
//       rating: 5,
//       deliveryDays: 3,
//       variants: [
//         ProductVariant('1 Kg', 139),
//         ProductVariant('5 Kg', 669),
//         ProductVariant('10 Kg', 1329),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Gobindo Bhog',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/BKEcfif3FQ8gsCt9q8Z93mevxfe0b33WSMoWs5oB.webp',
//       rating: 4.5,
//       deliveryDays: 7,
//       variants: [
//         ProductVariant('1 Kg', 269),
//         ProductVariant('5 Kg', 1299),
//         ProductVariant('10 Kg', 2499),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Exclusive Basmati',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/H9vrMOozhHWyosbPSZ8v3mzqod7JL54ItJVqSLWZ.jpg',
//       rating: 5,
//       deliveryDays: 4,
//       variants: [
//         ProductVariant('1 Kg', 119),
//         ProductVariant('5 Kg', 569),
//         ProductVariant('10 Kg', 1129),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Traditional Basmati Rice',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
//       rating: 4.5,
//       deliveryDays: 5,
//       variants: [
//         ProductVariant('1 Kg', 199),
//         ProductVariant('5 Kg', 949),
//         ProductVariant('10 Kg', 1849),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Ratna Rice',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
//       rating: 4.5,
//       deliveryDays: 4,
//       variants: [
//         ProductVariant('1 Kg', 129),
//         ProductVariant('5 Kg', 619),
//         ProductVariant('10 Kg', 1219),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Jeera Kathi',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/T2Abcc1fAfCuKLk4C8brHaK3qhdFIQA9yHZJy4xl.webp',
//       rating: 4.5,
//       deliveryDays: 6,
//       variants: [
//         ProductVariant('1 Kg', 159),
//         ProductVariant('5 Kg', 759),
//         ProductVariant('10 Kg', 1499),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Premium Rice',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/wSzQEEq643gTAaVxi2KbaCLIBBevZDP5qgzTW8Nc.webp',
//       rating: 4.5,
//       deliveryDays: 4,
//       variants: [
//         ProductVariant('1 Kg', 149),
//         ProductVariant('5 Kg', 699),
//         ProductVariant('10 Kg', 1379),
//       ],
//     ),
//     ProductItem(
//       name: 'Lalbaba Special Rice',
//       image:
//           'https://lalbabaonline.com/public/uploads/all/w1HSz6wWKrkS08AysfcGQ3l8uoBh6kRaK5k0PBhS.jpg',
//       rating: 4.5,
//       deliveryDays: 5,
//       variants: [
//         ProductVariant('1 Kg', 169),
//         ProductVariant('5 Kg', 799),
//         ProductVariant('10 Kg', 1549),
//       ],
//     ),
//   ];

//   // ================================================================
//   // INIT
//   // ================================================================

//   @override
//   void initState() {
//     super.initState();

//     cartCount = widget.initialCartCount;

//     _filteredProducts = List<ProductItem>.from(products);

//     if (CartCountManager.currentCount < widget.initialCartCount) {
//       CartCountManager.setCount(widget.initialCartCount);
//     }
//   }

//   // ================================================================
//   // ADD TO CART
//   // ================================================================

//   void _addToCart(
//     ProductItem product,
//     int quantity,
//   ) {
//     if (quantity <= 0) return;

//     setState(() {
//       cartCount += quantity;
//     });

//     CartCountManager.add(quantity);

//     widget.onCartCountChanged?.call(
//       CartCountManager.currentCount,
//     );

//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(
//         SnackBar(
//           content: Text(
//             '${product.name} added to cart',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           duration: const Duration(milliseconds: 900),
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//   }

//   // ================================================================
//   // BACK
//   // ================================================================

//   void _goBack() {
//     Navigator.pop(
//       context,
//       CartCountManager.currentCount,
//     );
//   }

//   // ================================================================
//   // BUILD
//   // ================================================================

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (didPop, result) {
//         if (!didPop) {
//           _goBack();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: const Color(0xfffafafa),
//         appBar: const AppAppBar(
//           title: 'Products',
//           centerTitle: true,
//           automaticallyImplyLeading: true,
//         ),
//         body: Column(
//           children: [
//             _buildProductHeader(),

//             Expanded(
//               child: _filteredProducts.isEmpty
//                   ? _buildEmptyResult()
//                   : GridView.builder(
//                       padding: const EdgeInsets.fromLTRB(
//                         7,
//                         8,
//                         7,
//                         15,
//                       ),
//                       itemCount: _filteredProducts.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 7,
//                         mainAxisSpacing: 8,
//                         mainAxisExtent: 385,
//                       ),
//                       itemBuilder: (context, index) {
//                         final product = _filteredProducts[index];

//                         return ProductCard(
//                           key: ValueKey(product.name),
//                           product: product,
//                           onWeightTap: () {
//                             _showWeightSheet(product);
//                           },
//                           onAddToCart: (quantity) {
//                             _addToCart(product, quantity);
//                           },
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ================================================================
//   // EMPTY RESULT
//   // ================================================================

//   Widget _buildEmptyResult() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.filter_alt_off,
//             size: 55,
//             color: Colors.grey.shade400,
//           ),
//           const SizedBox(height: 15),
//           const Text(
//             'No products found',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Try changing your filter options.',
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey.shade600,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _clearFilters,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//               elevation: 0,
//             ),
//             child: const Text('CLEAR FILTER'),
//           ),
//         ],
//       ),
//     );
//   }

//   // ================================================================
//   // PRODUCT HEADER
//   // ================================================================

//   Widget _buildProductHeader() {
//     final filterCount =
//         _selectedCategories.length + _selectedWeights.length;

//     return Container(
//       height: 55,
//       padding: const EdgeInsets.symmetric(horizontal: 11),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           top: BorderSide(color: Color(0xffeeeeee)),
//           bottom: BorderSide(color: Color(0xffeeeeee)),
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               filterCount > 0
//                   ? 'Filtered products (${_filteredProducts.length})'
//                   : 'All products',
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Color(0xff222222),
//               ),
//             ),
//           ),

//           // SORT
//           GestureDetector(
//             onTap: _showSortSheet,
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Sort By',
//                   style: TextStyle(
//                     fontSize: 12.5,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xffe23f1c),
//                   ),
//                 ),
//                 Icon(
//                   Icons.keyboard_arrow_down,
//                   size: 17,
//                   color: Color(0xffe23f1c),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(width: 10),

//           // FILTER
//           GestureDetector(
//             onTap: _openFilter,
//             child: Container(
//               height: 32,
//               padding: const EdgeInsets.symmetric(horizontal: 9),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: const Color(0xffdddddd),
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.filter_list,
//                     size: 17,
//                     color: Color(0xff333333),
//                   ),
//                   const SizedBox(width: 3),
//                   const Text(
//                     'Filter',
//                     style: TextStyle(
//                       fontSize: 11.5,
//                       color: Color(0xff333333),
//                     ),
//                   ),
//                   if (filterCount > 0) ...[
//                     const SizedBox(width: 5),
//                     Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Text(
//                         '$filterCount',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ================================================================
//   // WEIGHT SHEET
//   // ================================================================

//   void _showWeightSheet(ProductItem product) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: const Color(0xfffafaff),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(24),
//         ),
//       ),
//       builder: (context) {
//         return SafeArea(
//           top: false,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: 10),

//               Container(
//                 width: 42,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),

//               const SizedBox(height: 5),

//               ...List.generate(
//                 product.variants.length,
//                 (index) {
//                   final item = product.variants[index];
//                   final selected =
//                       product.selectedVariant == index;

//                   return InkWell(
//                     onTap: () {
//                       setState(() {
//                         product.selectedVariant = index;
//                       });

//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 20,
//                       ),
//                       decoration: const BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                             color: Color(0xffdddddd),
//                           ),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               '${item.weight} - Rs ${item.price.toStringAsFixed(2)}',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 color: Color(0xff222222),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             width: 23,
//                             height: 23,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: selected
//                                     ? const Color(0xff315a99)
//                                     : const Color(0xff555555),
//                                 width: 2,
//                               ),
//                             ),
//                             child: selected
//                                 ? Center(
//                                     child: Container(
//                                       width: 11,
//                                       height: 11,
//                                       decoration:
//                                           const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Color(0xff315a99),
//                                       ),
//                                     ),
//                                   )
//                                 : null,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 5),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // ================================================================
//   // SORT
//   // ================================================================

//   void _showSortSheet() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (context) {
//         return SafeArea(
//           top: false,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(18),
//                 child: Text(
//                   'Sort By',
//                   style: TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               _sortItem('Default'),
//               _sortItem('Price: Low to High'),
//               _sortItem('Price: High to Low'),
//               _sortItem('Newest'),
//               const SizedBox(height: 10),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _sortItem(String title) {
//     final selected = _selectedSort == title;

//     return ListTile(
//       dense: true,
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight:
//               selected ? FontWeight.w600 : FontWeight.normal,
//         ),
//       ),
//       trailing: selected
//           ? const Icon(
//               Icons.check,
//               color: Colors.red,
//               size: 20,
//             )
//           : const Icon(
//               Icons.chevron_right,
//               size: 20,
//             ),
//       onTap: () {
//         Navigator.pop(context);

//         setState(() {
//           _selectedSort = title;
//         });

//         _applyFilters();
//       },
//     );
//   }

//   // ================================================================
//   // OPEN FILTER
//   // ================================================================

//   Future<void> _openFilter() async {
//     final result = await showGeneralDialog<FilterResult>(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'Filter',
//       barrierColor: Colors.black54,
//       transitionDuration: const Duration(milliseconds: 250),
//       pageBuilder: (
//         context,
//         animation,
//         secondaryAnimation,
//       ) {
//         return FilterDrawer(
//           initialPriceRange: _priceRange,
//           initialCategories: _selectedCategories,
//           initialWeights: _selectedWeights,
//         );
//       },
//       transitionBuilder: (
//         context,
//         animation,
//         secondaryAnimation,
//         child,
//       ) {
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(1, 0),
//             end: Offset.zero,
//           ).animate(
//             CurvedAnimation(
//               parent: animation,
//               curve: Curves.easeOut,
//             ),
//           ),
//           child: child,
//         );
//       },
//     );

//     if (result != null) {
//       setState(() {
//         _priceRange = result.priceRange;
//         _selectedCategories =
//             Set<String>.from(result.categories);
//         _selectedWeights =
//             Set<String>.from(result.weights);
//       });

//       _applyFilters();
//     }
//   }

//   // ================================================================
//   // APPLY FILTER
//   // ================================================================

//   void _applyFilters() {
//     List<ProductItem> result =
//         List<ProductItem>.from(products);

//     // ==============================================================
//     // CATEGORY
//     // ==============================================================

//     // Empty category means ALL
//     if (_selectedCategories.isNotEmpty) {
//       result = result.where((product) {
//         return _productMatchesCategory(
//           product,
//           _selectedCategories,
//         );
//       }).toList();
//     }

//     // ==============================================================
//     // WEIGHT + PRICE
//     // ==============================================================

//     result = result.where((product) {
//       return product.variants.any((variant) {
//         final priceMatch =
//             variant.price >= _priceRange.start &&
//             variant.price <= _priceRange.end;

//         final weightMatch =
//             _selectedWeights.isEmpty ||
//             _selectedWeights.contains(variant.weight);

//         return priceMatch && weightMatch;
//       });
//     }).toList();

//     // ==============================================================
//     // SORT
//     // ==============================================================

//     switch (_selectedSort) {
//       case 'Price: Low to High':
//         result.sort(
//           (a, b) => _lowestPrice(a)
//               .compareTo(_lowestPrice(b)),
//         );
//         break;

//       case 'Price: High to Low':
//         result.sort(
//           (a, b) => _lowestPrice(b)
//               .compareTo(_lowestPrice(a)),
//         );
//         break;

//       case 'Newest':
//         // Current model does not have createdAt.
//         break;

//       case 'Default':
//       default:
//         break;
//     }

//     setState(() {
//       _filteredProducts = result;
//     });
//   }

//   // ================================================================
//   // CATEGORY MATCH
//   // ================================================================

//   bool _productMatchesCategory(
//     ProductItem product,
//     Set<String> categories,
//   ) {
//     final name = product.name.toLowerCase();

//     for (final category in categories) {
//       switch (category.toLowerCase()) {
//         case 'minikit':
//           if (name.contains('minikit')) {
//             return true;
//           }
//           break;

//         case 'banskathi':
//           if (name.contains('banskathi')) {
//             return true;
//           }
//           break;

//         case 'ratna':
//           if (name.contains('ratna')) {
//             return true;
//           }
//           break;

//         case 'gobindo bhog':
//           if (name.contains('gobindo bhog')) {
//             return true;
//           }
//           break;

//         case 'basmati':
//           if (name.contains('basmati')) {
//             return true;
//           }
//           break;

//         case 'jeera kathi':
//           if (name.contains('jeera kathi')) {
//             return true;
//           }
//           break;
//       }
//     }

//     return false;
//   }

//   // ================================================================
//   // LOWEST PRICE
//   // ================================================================

//   double _lowestPrice(ProductItem product) {
//     if (product.variants.isEmpty) {
//       return double.infinity;
//     }

//     return product.variants
//         .map((e) => e.price)
//         .reduce((a, b) => a < b ? a : b);
//   }

//   // ================================================================
//   // CLEAR FILTER
//   // ================================================================

//   void _clearFilters() {
//     setState(() {
//       _priceRange = const RangeValues(119, 1649);

//       _selectedCategories.clear();
//       _selectedWeights.clear();

//       _selectedSort = 'Default';

//       _filteredProducts =
//           List<ProductItem>.from(products);
//     });
//   }
// }

// // ==================================================================
// // PRODUCT CARD
// // ==================================================================

// class ProductCard extends StatefulWidget {
//   final ProductItem product;
//   final VoidCallback onWeightTap;
//   final ValueChanged<int> onAddToCart;

//   const ProductCard({
//     super.key,
//     required this.product,
//     required this.onWeightTap,
//     required this.onAddToCart,
//   });

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   bool favourite = false;
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     final product = widget.product;

//     final selected =
//         product.variants[product.selectedVariant];

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(
//           color: const Color(0xffeeeeee),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.035),
//             blurRadius: 3,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(6, 5, 6, 6),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: 158,
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Image.network(
//                         product.image,
//                         fit: BoxFit.contain,
//                         errorBuilder: (
//                           context,
//                           error,
//                           stackTrace,
//                         ) {
//                           return const Center(
//                             child: Icon(
//                               Icons.image_not_supported,
//                               size: 35,
//                               color: Colors.grey,
//                             ),
//                           );
//                         },
//                         loadingBuilder: (
//                           context,
//                           child,
//                           progress,
//                         ) {
//                           if (progress == null) {
//                             return child;
//                           }

//                           return const Center(
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     right: 1,
//                     top: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           favourite = !favourite;
//                         });
//                       },
//                       child: SizedBox(
//                         width: 28,
//                         height: 28,
//                         child: Icon(
//                           favourite
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           size: 18,
//                           color: favourite
//                               ? Colors.red
//                               : const Color(0xff777777),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 2),

//             SizedBox(
//               height: 31,
//               width: double.infinity,
//               child: Text(
//                 product.name,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 11.5,
//                   height: 1.25,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff222222),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 2),

//             SizedBox(
//               height: 18,
//               child: Row(
//                 children: List.generate(
//                   5,
//                   (index) {
//                     if (product.rating >= index + 1) {
//                       return const Icon(
//                         Icons.star,
//                         size: 14,
//                         color: Color(0xffffa800),
//                       );
//                     }

//                     if (product.rating > index) {
//                       return const Icon(
//                         Icons.star_half,
//                         size: 14,
//                         color: Color(0xffffa800),
//                       );
//                     }

//                     return const Icon(
//                       Icons.star_border,
//                       size: 14,
//                       color: Color(0xffffa800),
//                     );
//                   },
//                 ),
//               ),
//             ),

//             const SizedBox(height: 3),

//             GestureDetector(
//               onTap: widget.onWeightTap,
//               child: Container(
//                 width: double.infinity,
//                 height: 34,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: const Color(0xff999999),
//                   ),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${selected.weight} - Rs ${selected.price.toStringAsFixed(2)}',
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 10,
//                           color: Color(0xff777777),
//                         ),
//                       ),
//                     ),
//                     const Icon(
//                       Icons.keyboard_arrow_down,
//                       size: 15,
//                       color: Color(0xff777777),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 2),

//             SizedBox(
//               height: 21,
//               child: Text(
//                 '₹${selected.price.toStringAsFixed(2)}',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 15.5,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff222222),
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 28,
//               child: Row(
//                 crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.delivery_dining_outlined,
//                     size: 14,
//                     color: Color(0xff888888),
//                   ),
//                   const SizedBox(width: 2),
//                   Expanded(
//                     child: Text(
//                       'Estimated Delivery: ${product.deliveryDays} days',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 9,
//                         height: 1.15,
//                         color: Color(0xff555555),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 3),

//             SizedBox(
//               height: 31,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Container(
//                       height: 31,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: const Color(0xffdddddd),
//                         ),
//                         borderRadius:
//                             BorderRadius.circular(4),
//                       ),
//                       child: Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 3),
//                             child: Text(
//                               'Qty',
//                               style: TextStyle(
//                                 fontSize: 7,
//                                 color: Color(0xff888888),
//                               ),
//                             ),
//                           ),

//                           Expanded(
//                             child: InkWell(
//                               onTap: quantity > 1
//                                   ? () {
//                                       setState(() {
//                                         quantity--;
//                                       });
//                                     }
//                                   : null,
//                               child: const Center(
//                                 child: Icon(
//                                   Icons.remove,
//                                   size: 9,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           Text(
//                             '$quantity',
//                             style: const TextStyle(
//                               fontSize: 9,
//                             ),
//                           ),

//                           Expanded(
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   quantity++;
//                                 });
//                               },
//                               child: const Center(
//                                 child: Icon(
//                                   Icons.add,
//                                   size: 9,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 4),

//                   Expanded(
//                     flex: 5,
//                     child: SizedBox(
//                       height: 31,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           widget.onAddToCart(quantity);

//                           setState(() {
//                             quantity = 1;
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           foregroundColor: Colors.white,
//                           elevation: 0,
//                           padding: EdgeInsets.zero,
//                           minimumSize: Size.zero,
//                           shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.circular(4),
//                           ),
//                         ),
//                         child: const Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'ADD',
//                               style: TextStyle(
//                                 fontSize: 9,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 2),
//                             Icon(
//                               Icons.shopping_cart_outlined,
//                               size: 12,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ==================================================================
// // FILTER RESULT
// // ==================================================================

// class FilterResult {
//   final RangeValues priceRange;
//   final Set<String> categories;
//   final Set<String> weights;

//   const FilterResult({
//     required this.priceRange,
//     required this.categories,
//     required this.weights,
//   });
// }

// // ==================================================================
// // FILTER DRAWER
// // ==================================================================

// class FilterDrawer extends StatefulWidget {
//   final RangeValues initialPriceRange;
//   final Set<String> initialCategories;
//   final Set<String> initialWeights;

//   const FilterDrawer({
//     super.key,
//     required this.initialPriceRange,
//     required this.initialCategories,
//     required this.initialWeights,
//   });

//   @override
//   State<FilterDrawer> createState() => _FilterDrawerState();
// }

// class _FilterDrawerState extends State<FilterDrawer> {
//   late RangeValues priceRange;

//   // ================================================================
//   // ALL ADDED HERE
//   // ================================================================

//   final List<String> categories = [
//     'All',
//     'Minikit',
//     'Banskathi',
//     'Ratna',
//     'Gobindo Bhog',
//     'Basmati',
//     'JEERA KATHI',
//   ];

//   final List<String> weights = [
//     '1 Kg',
//     '2 Kg',
//     '5 Kg',
//     '10 Kg',
//     '26 Kg',
//     '30 Kg',
//     '40 Kg',
//   ];

//   late Set<String> selectedCategories;
//   late Set<String> selectedWeights;

//   @override
//   void initState() {
//     super.initState();

//     priceRange = widget.initialPriceRange;

//     selectedCategories =
//         Set<String>.from(widget.initialCategories);

//     selectedWeights =
//         Set<String>.from(widget.initialWeights);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth =
//         MediaQuery.of(context).size.width;

//     return Align(
//       alignment: Alignment.centerRight,
//       child: Material(
//         color: Colors.white,
//         child: SizedBox(
//           width: screenWidth * 0.82,
//           height: double.infinity,
//           child: SafeArea(
//             child: Column(
//               children: [
//                 // ======================================================
//                 // HEADER
//                 // ======================================================

//                 SizedBox(
//                   height: 62,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 18,
//                     ),
//                     child: Row(
//                       children: [
//                         const Text(
//                           'Filters',
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(
//                             Icons.close,
//                             size: 29,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 const Divider(height: 1),

//                 // ======================================================
//                 // BODY
//                 // ======================================================

//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics:
//                         const BouncingScrollPhysics(),
//                     child: Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                       children: [
//                         // ==================================================
//                         // CATEGORIES
//                         // ==================================================

//                         _sectionTitle('Categories'),

//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                             27,
//                             10,
//                             20,
//                             14,
//                           ),
//                           child: Column(
//                             children: categories.map(
//                               (category) {
//                                 // ALL checked when no category selected
//                                 final checked =
//                                     category == 'All'
//                                         ? selectedCategories.isEmpty
//                                         : selectedCategories
//                                             .contains(category);

//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       // =================================================
//                                       // ALL
//                                       // =================================================

//                                       if (category == 'All') {
//                                         // All = no category restriction
//                                         selectedCategories.clear();
//                                       }

//                                       // ================================================
//                                       // OTHER CATEGORY
//                                       // ================================================

//                                       else {
//                                         if (selectedCategories
//                                             .contains(category)) {
//                                           selectedCategories
//                                               .remove(category);
//                                         } else {
//                                           selectedCategories
//                                               .add(category);
//                                         }
//                                       }
//                                     });
//                                   },
//                                   child: SizedBox(
//                                     height: 49,
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             category,
//                                             style:
//                                                 const TextStyle(
//                                               fontSize: 15.5,
//                                               fontWeight:
//                                                   FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                         if (checked)
//                                           const Icon(
//                                             Icons.check,
//                                             color: Colors.red,
//                                             size: 20,
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ).toList(),
//                           ),
//                         ),

//                         // ==================================================
//                         // PRICE
//                         // ==================================================

//                         _sectionTitle('Price range'),

//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                             15,
//                             12,
//                             15,
//                             15,
//                           ),
//                           child: Column(
//                             children: [
//                               RangeSlider(
//                                 values: priceRange,
//                                 min: 119,
//                                 max: 1649,
//                                 activeColor: Colors.red,
//                                 inactiveColor:
//                                     Colors.grey.shade200,
//                                 onChanged: (values) {
//                                   setState(() {
//                                     priceRange = values;
//                                   });
//                                 },
//                               ),

//                               Row(
//                                 children: [
//                                   Text(
//                                     '₹${priceRange.start.toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Text(
//                                     '₹${priceRange.end.toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),

//                         // ==================================================
//                         // WEIGHT
//                         // ==================================================

//                         _sectionTitle('Filter by Weight'),

//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                             17,
//                             7,
//                             17,
//                             20,
//                           ),
//                           child: Column(
//                             children: weights.map(
//                               (weight) {
//                                 final checked =
//                                     selectedWeights
//                                         .contains(weight);

//                                 return SizedBox(
//                                   height: 55,
//                                   child: InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         if (checked) {
//                                           selectedWeights
//                                               .remove(weight);
//                                         } else {
//                                           selectedWeights
//                                               .add(weight);
//                                         }
//                                       });
//                                     },
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 25,
//                                           height: 25,
//                                           child: Checkbox(
//                                             value: checked,
//                                             activeColor:
//                                                 Colors.red,
//                                             onChanged:
//                                                 (value) {
//                                               setState(() {
//                                                 if (value ==
//                                                     true) {
//                                                   selectedWeights
//                                                       .add(weight);
//                                                 } else {
//                                                   selectedWeights
//                                                       .remove(weight);
//                                                 }
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Text(
//                                           weight,
//                                           style:
//                                               const TextStyle(
//                                             fontSize: 16.5,
//                                             fontWeight:
//                                                 FontWeight.w500,
//                                             decoration:
//                                                 TextDecoration
//                                                     .underline,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ).toList(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // ======================================================
//                 // BOTTOM BUTTON
//                 // ======================================================

//                 Container(
//                   padding: const EdgeInsets.all(13),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(.10),
//                         blurRadius: 8,
//                         offset: const Offset(0, -2),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       // CLEAR
//                       Expanded(
//                         flex: 4,
//                         child: SizedBox(
//                           height: 45,
//                           child: OutlinedButton(
//                             onPressed: () {
//                               setState(() {
//                                 priceRange =
//                                     const RangeValues(
//                                   119,
//                                   1649,
//                                 );

//                                 selectedCategories.clear();
//                                 selectedWeights.clear();
//                               });
//                             },
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Colors.red,
//                               side: const BorderSide(
//                                 color: Colors.red,
//                               ),
//                               shape:
//                                   RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.circular(5),
//                               ),
//                             ),
//                             child: const Text(
//                               'CLEAR',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 8),

//                       // APPLY
//                       Expanded(
//                         flex: 6,
//                         child: SizedBox(
//                           height: 45,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(
//                                 context,
//                                 FilterResult(
//                                   priceRange: priceRange,
//                                   categories:
//                                       Set<String>.from(
//                                     selectedCategories,
//                                   ),
//                                   weights:
//                                       Set<String>.from(
//                                     selectedWeights,
//                                   ),
//                                 ),
//                               );
//                             },
//                             style:
//                                 ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                               foregroundColor: Colors.white,
//                               elevation: 0,
//                               shape:
//                                   RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.circular(5),
//                               ),
//                             ),
//                             child: const Text(
//                               'APPLY FILTER',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ================================================================
//   // SECTION TITLE
//   // ================================================================

//   Widget _sectionTitle(String title) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.fromLTRB(
//         27,
//         20,
//         18,
//         17,
//       ),
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: Color(0xffdddddd),
//           ),
//         ),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 21,
//           fontWeight: FontWeight.w500,
//           color: Color(0xff222222),
//         ),
//       ),
//     );
//   }
// }

// // ==================================================================
// // PRODUCT MODEL
// // ==================================================================

// class ProductItem {
//   final String name;
//   final String image;
//   final double rating;
//   final int deliveryDays;
//   final List<ProductVariant> variants;

//   int selectedVariant;

//   ProductItem({
//     required this.name,
//     required this.image,
//     required this.rating,
//     required this.deliveryDays,
//     required this.variants,
//     this.selectedVariant = 0,
//   });
// }

// // ==================================================================
// // PRODUCT VARIANT
// // ==================================================================

// class ProductVariant {
//   final String weight;
//   final double price;

//   ProductVariant(
//     this.weight,
//     this.price,
//   );
// }



import 'package:flutter/material.dart';

import '../../../../core/widgets/app_app_bar.dart';
import '../../../home/presentation/widgets/appbar_widget.dart';

class ProductListPage extends StatefulWidget {
  final int initialCartCount;
  final ValueChanged<int>? onCartCountChanged;

  // null       = all products
  // trending   = trending products
  // bestSeller = best seller products
  final String? sectionType;

  final String pageTitle;

  const ProductListPage({
    super.key,
    this.initialCartCount = 0,
    this.onCartCountChanged,
    this.sectionType,
    this.pageTitle = 'Products',
  });

  @override
  State<ProductListPage> createState() =>
      _ProductListPageState();
}

class _ProductListPageState
    extends State<ProductListPage> {
  late int cartCount;

  RangeValues _priceRange =
      const RangeValues(119, 1649);

  final Set<String> _selectedCategories = {};

  final Set<String> _selectedWeights = {};

  String _selectedSort = 'Default';

  late List<ProductItem> _filteredProducts;

  // ===========================================================================
  // PRODUCTS
  // ===========================================================================

  final List<ProductItem> products = [
    ProductItem(
      name: 'Lalbaba Superior Banskathi',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/oAHc705alFhNrcljUs2QjIaemF95khJs5nisUpma.webp',
      rating: 5,
      deliveryDays: 3,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 139,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 669,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1329,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Gobindo Bhog',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/BKEcfif3FQ8gsCt9q8Z93emvxfe0b33WSMoWs5oB.webp',
      rating: 4.5,
      deliveryDays: 7,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 269,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 1299,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 2499,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Exclusive Basmati',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/H9vrMOozhHWyosbPSZ8v3mzqod7JL54ItJVqSLWZ.jpg',
      rating: 5,
      deliveryDays: 4,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 119,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 569,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1129,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Traditional Basmati Rice',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
      rating: 4.5,
      deliveryDays: 5,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 199,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 949,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1849,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Ratna Rice',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
      rating: 4.5,
      deliveryDays: 4,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 129,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 619,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1219,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Jeera Kathi',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/T2Abcc1fAfCuKLk4C8brHaK3qhdFIQA9yHZJy4xl.webp',
      rating: 4.5,
      deliveryDays: 6,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 159,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 759,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1499,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Premium Rice',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/wSzQEEq643gTAaVxi2KbaCLIBBevZDP5qgzTW8Nc.webp',
      rating: 4.5,
      deliveryDays: 4,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 149,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 699,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1379,
        ),
      ],
    ),

    ProductItem(
      name: 'Lalbaba Special Rice',
      imageUrl:
          'https://lalbabaonline.com/public/uploads/all/w1HSz6wWKrkS08AysfcGQ3l8uoBh6kRaK5k0PBhS.jpg',
      rating: 4.5,
      deliveryDays: 5,
      variants: [
        ProductVariant(
          weight: '1 Kg',
          price: 169,
        ),
        ProductVariant(
          weight: '5 Kg',
          price: 799,
        ),
        ProductVariant(
          weight: '10 Kg',
          price: 1549,
        ),
      ],
    ),
  ];

  // ===========================================================================
  // INIT STATE
  // ===========================================================================

  @override
  void initState() {
    super.initState();

    cartCount = widget.initialCartCount;

    _filteredProducts = _getSectionProducts();

    if (CartCountManager.currentCount <
        widget.initialCartCount) {
      CartCountManager.setCount(
        widget.initialCartCount,
      );
    }
  }

  // ===========================================================================
  // SECTION PRODUCTS
  // ===========================================================================

  List<ProductItem> _getSectionProducts() {
    // -------------------------------------------------------------------------
    // ALL PRODUCTS
    // -------------------------------------------------------------------------

    if (widget.sectionType == null) {
      return List<ProductItem>.from(
        products,
      );
    }

    // -------------------------------------------------------------------------
    // TRENDING
    // -------------------------------------------------------------------------

    if (widget.sectionType == 'trending') {
      return products.where((product) {
        final name =
            product.name.toLowerCase();

        return name.contains('minikit') ||
            name.contains('basmati') ||
            name.contains('jeera');
      }).toList();
    }

    // -------------------------------------------------------------------------
    // BEST SELLER
    // -------------------------------------------------------------------------

    if (widget.sectionType == 'bestSeller') {
      return products.where((product) {
        final name =
            product.name.toLowerCase();

        return name.contains('minikit') ||
            name.contains('basmati') ||
            name.contains('jeera');
      }).toList();
    }

    // -------------------------------------------------------------------------
    // FALLBACK
    // -------------------------------------------------------------------------

    return List<ProductItem>.from(
      products,
    );
  }

  // ===========================================================================
  // ADD TO CART
  // ===========================================================================

  void _addToCart(
    ProductItem product,
    int quantity,
  ) {
    if (quantity <= 0) return;

    setState(() {
      cartCount += quantity;
    });

    CartCountManager.add(quantity);

    widget.onCartCountChanged?.call(
      CartCountManager.currentCount,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} added to cart',
        ),
        duration: const Duration(
          milliseconds: 900,
        ),
      ),
    );
  }

  // ===========================================================================
  // BACK
  // ===========================================================================

  void _goBack() {
    Navigator.pop(
      context,
      CartCountManager.currentCount,
    );
  }

  // ===========================================================================
  // BUILD
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (
        didPop,
        result,
      ) {
        if (!didPop) {
          _goBack();
        }
      },

      child: Scaffold(
        backgroundColor:
            const Color(0xfffafafa),

        // DESIGN SAME
        appBar: AppAppBar(
          title: widget.pageTitle,
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),

        body: Column(
          children: [
            _buildProductHeader(),

            Expanded(
              child: _filteredProducts.isEmpty
                  ? _buildEmptyResult()
                  : GridView.builder(
                      padding:
                          const EdgeInsets.only(
                        left: 7,
                        right: 7,
                        top: 8,
                        bottom: 15,
                      ),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 385,
                      ),

                      itemCount:
                          _filteredProducts.length,

                      itemBuilder: (
                        context,
                        index,
                      ) {
                        final product =
                            _filteredProducts[
                                index];

                        return ProductCard(
                          key: ValueKey(
                            product.name,
                          ),

                          product: product,

                          onWeightTap: () {
                            _showWeightSheet(
                              product,
                            );
                          },

                          onAddToCart: (
                            quantity,
                          ) {
                            _addToCart(
                              product,
                              quantity,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // EMPTY RESULT
  // ===========================================================================

  Widget _buildEmptyResult() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.search_off,
            size: 60,
            color: Colors.grey,
          ),

          const SizedBox(height: 12),

          const Text(
            'No products found',

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Try changing your filter options.',

            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: _clearFilters,

            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFFE23F1C),

              foregroundColor:
                  Colors.white,
            ),

            child: const Text(
              'CLEAR FILTER',
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // PRODUCT HEADER
  // ===========================================================================

  Widget _buildProductHeader() {
    final filterCount =
        _selectedCategories.length +
        _selectedWeights.length;

    final bool hasFilter =
        _selectedCategories.isNotEmpty ||
        _selectedWeights.isNotEmpty ||
        _priceRange.start != 119 ||
        _priceRange.end != 1649;

    return Container(
      height: 55,

      decoration: const BoxDecoration(
        color: Colors.white,

        border: Border(
          top: BorderSide(
            color: Color(0xffeeeeee),
          ),
          bottom: BorderSide(
            color: Color(0xffeeeeee),
          ),
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 14,
              ),

              child: Text(
                hasFilter
                    ? 'Filtered products (${_filteredProducts.length})'
                    : '${widget.pageTitle} (${_filteredProducts.length})',

                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // SORT
          GestureDetector(
            onTap: _showSortSheet,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.sort,
                    size: 19,
                  ),

                  SizedBox(width: 4),

                  Text(
                    'Sort By',

                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // FILTER
          GestureDetector(
            onTap: _openFilter,

            child: Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                ),

                borderRadius:
                    BorderRadius.circular(5),
              ),

              child: Row(
                children: [
                  const Icon(
                    Icons.filter_list,
                    size: 18,
                  ),

                  const SizedBox(width: 3),

                  const Text(
                    'Filter',

                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),

                  if (filterCount > 0) ...[
                    const SizedBox(width: 4),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),

                      decoration:
                          const BoxDecoration(
                        color:
                            Color(0xFFE23F1C),
                        shape:
                            BoxShape.circle,
                      ),

                      child: Text(
                        '$filterCount',

                        style:
                            const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // WEIGHT SHEET
  // ===========================================================================

  void _showWeightSheet(
    ProductItem product,
  ) {
    showModalBottomSheet(
      context: context,

      backgroundColor:
          const Color(0xfffafafa),

      shape:
          const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),

      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              18,
            ),

            child: Column(
              mainAxisSize:
                  MainAxisSize.min,

              children: [
                Text(
                  product.name,

                  style:
                      const TextStyle(
                    fontSize: 17,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                ...List.generate(
                  product.variants.length,
                  (index) {
                    final item =
                        product.variants[
                            index];

                    final selected =
                        product.selectedVariant ==
                            index;

                    return ListTile(
                      onTap: () {
                        setState(() {
                          product
                                  .selectedVariant =
                              index;
                        });

                        Navigator.pop(
                          context,
                        );
                      },

                      leading: Container(
                        width: 22,
                        height: 22,

                        decoration:
                            BoxDecoration(
                          shape:
                              BoxShape.circle,

                          border: Border.all(
                            color: selected
                                ? const Color(
                                    0xFFE23F1C,
                                  )
                                : Colors.grey,

                            width: 2,
                          ),
                        ),

                        child: selected
                            ? const Center(
                                child:
                                    CircleAvatar(
                                  radius: 6,
                                  backgroundColor:
                                      Color(
                                    0xFFE23F1C,
                                  ),
                                ),
                              )
                            : null,
                      ),

                      title: Text(
                        '${item.weight} - Rs ${item.price.toStringAsFixed(2)}',
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // SORT SHEET
  // ===========================================================================

  void _showSortSheet() {
    const options = [
      'Default',
      'Price Low→High',
      'Price High→Low',
      'Newest',
    ];

    showModalBottomSheet(
      context: context,

      backgroundColor:
          Colors.white,

      shape:
          const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),

      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize:
                MainAxisSize.min,

            children: options.map(
              (option) {
                final selected =
                    _selectedSort ==
                        option;

                return ListTile(
                  title: Text(option),

                  trailing: selected
                      ? const Icon(
                          Icons.check,
                          color:
                              Color(
                            0xFFE23F1C,
                          ),
                        )
                      : null,

                  onTap: () {
                    Navigator.pop(
                      context,
                    );

                    setState(() {
                      _selectedSort =
                          option;
                    });

                    _applyFilters();
                  },
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // APPLY FILTERS
  // ===========================================================================

  void _applyFilters() {
    // IMPORTANT:
    // Start from current section products,
    // NOT from all products.
    List<ProductItem> result =
        _getSectionProducts();

    // -------------------------------------------------------------------------
    // CATEGORY
    // -------------------------------------------------------------------------

    if (_selectedCategories.isNotEmpty) {
      result = result.where(
        (product) {
          return _selectedCategories.any(
            (category) {
              return _productMatchesCategory(
                product,
                category,
              );
            },
          );
        },
      ).toList();
    }

    // -------------------------------------------------------------------------
    // PRICE + WEIGHT
    // -------------------------------------------------------------------------

    result = result.where(
      (product) {
        return product.variants.any(
          (variant) {
            final priceMatches =
                variant.price >=
                        _priceRange.start &&
                    variant.price <=
                        _priceRange.end;

            final weightMatches =
                _selectedWeights.isEmpty ||
                _selectedWeights.contains(
                  variant.weight,
                );

            return priceMatches &&
                weightMatches;
          },
        );
      },
    ).toList();

    // -------------------------------------------------------------------------
    // SORT
    // -------------------------------------------------------------------------

    switch (_selectedSort) {
      case 'Price Low→High':
        result.sort(
          (a, b) => _lowestPrice(a)
              .compareTo(
            _lowestPrice(b),
          ),
        );
        break;

      case 'Price High→Low':
        result.sort(
          (a, b) => _lowestPrice(b)
              .compareTo(
            _lowestPrice(a),
          ),
        );
        break;

      case 'Newest':
        // No createdAt field available.
        break;

      case 'Default':
        break;
    }

    setState(() {
      _filteredProducts = result;
    });
  }

  // ===========================================================================
  // CATEGORY MATCH
  // ===========================================================================

  bool _productMatchesCategory(
    ProductItem product,
    String category,
  ) {
    final name =
        product.name.toLowerCase();

    switch (category.toLowerCase()) {
      case 'minikit':
        return name.contains(
          'minikit',
        );

      case 'banskathi':
        return name.contains(
          'banskathi',
        );

      case 'ratna':
        return name.contains(
          'ratna',
        );

      case 'gobindo bhog':
        return name.contains(
          'gobindo bhog',
        );

      case 'basmati':
        return name.contains(
          'basmati',
        );

      case 'jeera kathi':
        return name.contains(
          'jeera kathi',
        );

      default:
        return false;
    }
  }

  // ===========================================================================
  // LOWEST PRICE
  // ===========================================================================

  double _lowestPrice(
    ProductItem product,
  ) {
    if (product.variants.isEmpty) {
      return double.infinity;
    }

    return product.variants
        .map(
          (variant) => variant.price,
        )
        .reduce(
          (a, b) => a < b ? a : b,
        );
  }

  // ===========================================================================
  // CLEAR FILTER
  // ===========================================================================

  void _clearFilters() {
    setState(() {
      _priceRange =
          const RangeValues(
        119,
        1649,
      );

      _selectedCategories.clear();

      _selectedWeights.clear();

      _selectedSort = 'Default';

      // IMPORTANT:
      // Clear filter করলে current section-এই ফিরে যাবে.
      _filteredProducts =
          _getSectionProducts();
    });
  }

  // ===========================================================================
  // FILTER DRAWER
  // ===========================================================================

  Future<void> _openFilter() async {
    final result =
        await showGeneralDialog<FilterResult>(
      context: context,

      barrierDismissible: true,

      barrierLabel: 'Filter',

      transitionDuration:
          const Duration(
        milliseconds: 250,
      ),

      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) {
        return Align(
          alignment:
              Alignment.centerRight,

          child: FilterDrawer(
            initialPriceRange:
                _priceRange,

            initialCategories:
                _selectedCategories,

            initialWeights:
                _selectedWeights,
          ),
        );
      },
    );

    if (result == null) {
      return;
    }

    setState(() {
      _priceRange =
          result.priceRange;

      _selectedCategories
        ..clear()
        ..addAll(
          result.categories,
        );

      _selectedWeights
        ..clear()
        ..addAll(
          result.weights,
        );
    });

    _applyFilters();
  }
}

// ==============================================================================
// PRODUCT CARD
// ==============================================================================

class ProductCard extends StatefulWidget {
  final ProductItem product;

  final VoidCallback onWeightTap;

  final ValueChanged<int>
      onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onWeightTap,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() =>
      _ProductCardState();
}

class _ProductCardState
    extends State<ProductCard> {
  bool favourite = false;

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product =
        widget.product;

    final selectedVariant =
        product.variants[
            product.selectedVariant];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(5),

        border: Border.all(
          color:
              const Color(0xffeeeeee),
        ),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withValues(
              alpha: 0.04,
            ),

            blurRadius: 5,

            offset:
                const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          // =====================================================================
          // IMAGE
          // =====================================================================

          SizedBox(
            height: 158,

            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    product.imageUrl,

                    fit:
                        BoxFit.contain,

                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress ==
                          null) {
                        return child;
                      }

                      return const Center(
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    },

                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color:
                              Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                Positioned(
                  top: 7,
                  right: 7,

                  child:
                      GestureDetector(
                    onTap: () {
                      setState(() {
                        favourite =
                            !favourite;
                      });
                    },

                    child: Icon(
                      favourite
                          ? Icons.favorite
                          : Icons.favorite_border,

                      color: favourite
                          ? const Color(
                              0xFFE23F1C,
                            )
                          : Colors.grey,

                      size: 23,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================================
          // NAME
          // =====================================================================

          SizedBox(
            height: 31,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 7,
              ),

              child: Text(
                product.name,

                maxLines: 2,

                overflow:
                    TextOverflow.ellipsis,

                style:
                    const TextStyle(
                  fontSize: 13,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),
          ),

          // =====================================================================
          // RATING
          // =====================================================================

          SizedBox(
            height: 25,

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children:
                  List.generate(
                5,
                (index) {
                  final rating =
                      product.rating;

                  if (rating >=
                      index + 1) {
                    return const Icon(
                      Icons.star,
                      size: 15,
                      color:
                          Colors.orange,
                    );
                  }

                  if (rating >=
                      index + 0.5) {
                    return const Icon(
                      Icons.star_half,
                      size: 15,
                      color:
                          Colors.orange,
                    );
                  }

                  return const Icon(
                    Icons.star_border,
                    size: 15,
                    color:
                        Colors.orange,
                  );
                },
              ),
            ),
          ),

          // =====================================================================
          // WEIGHT
          // =====================================================================

          GestureDetector(
            onTap:
                widget.onWeightTap,

            child: Container(
              height: 34,

              margin:
                  const EdgeInsets.symmetric(
                horizontal: 7,
              ),

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 8,
              ),

              decoration:
                  BoxDecoration(
                border: Border.all(
                  color:
                      Colors.grey.shade400,
                ),

                borderRadius:
                    BorderRadius.circular(
                  4,
                ),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${selectedVariant.weight} - Rs ${selectedVariant.price.toStringAsFixed(2)}',

                      maxLines: 1,

                      overflow:
                          TextOverflow.ellipsis,

                      style:
                          const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          // =====================================================================
          // PRICE
          // =====================================================================

          SizedBox(
            height: 21,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 7,
              ),

              child: Align(
                alignment:
                    Alignment.centerLeft,

                child: Text(
                  '₹${selectedVariant.price.toStringAsFixed(2)}',

                  style:
                      const TextStyle(
                    fontSize: 14,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // =====================================================================
          // DELIVERY
          // =====================================================================

          SizedBox(
            height: 28,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 7,
              ),

              child: Row(
                children: [
                  const Icon(
                    Icons.local_shipping_outlined,
                    size: 15,
                    color:
                        Colors.green,
                  ),

                  const SizedBox(
                    width: 4,
                  ),

                  Text(
                    'Delivery in ${product.deliveryDays} days',

                    style:
                        const TextStyle(
                      fontSize: 11,
                      color:
                          Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =====================================================================
          // QUANTITY + ADD
          // =====================================================================

          SizedBox(
            height: 31,

            child: Row(
              children: [
                // QUANTITY
                Container(
                  height: 29,

                  margin:
                      const EdgeInsets.only(
                    left: 7,
                  ),

                  decoration:
                      BoxDecoration(
                    border: Border.all(
                      color:
                          Colors.grey.shade400,
                    ),

                    borderRadius:
                        BorderRadius.circular(
                      4,
                    ),
                  ),

                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min,

                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(
                          horizontal: 4,
                        ),

                        child: Text(
                          'Qty',

                          style:
                              TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          if (quantity >
                              1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },

                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(
                            horizontal: 5,
                          ),

                          child: Icon(
                            Icons.remove,
                            size: 14,
                          ),
                        ),
                      ),

                      Text(
                        '$quantity',

                        style:
                            const TextStyle(
                          fontSize: 11,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },

                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(
                            horizontal: 5,
                          ),

                          child: Icon(
                            Icons.add,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 5,
                ),

                // ADD
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(
                      right: 7,
                    ),

                    child: SizedBox(
                      height: 29,

                      child:
                          ElevatedButton(
                        onPressed: () {
                          widget
                              .onAddToCart(
                            quantity,
                          );

                          setState(() {
                            quantity = 1;
                          });
                        },

                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                            0xFFE23F1C,
                          ),

                          foregroundColor:
                              Colors.white,

                          padding:
                              EdgeInsets.zero,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              4,
                            ),
                          ),
                        ),

                        child:
                            const Text(
                          'ADD',

                          style:
                              TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==============================================================================
// FILTER RESULT
// ==============================================================================

class FilterResult {
  final RangeValues priceRange;

  final Set<String> categories;

  final Set<String> weights;

  const FilterResult({
    required this.priceRange,
    required this.categories,
    required this.weights,
  });
}

// ==============================================================================
// FILTER DRAWER
// ==============================================================================

class FilterDrawer extends StatefulWidget {
  final RangeValues initialPriceRange;

  final Set<String> initialCategories;

  final Set<String> initialWeights;

  const FilterDrawer({
    super.key,
    required this.initialPriceRange,
    required this.initialCategories,
    required this.initialWeights,
  });

  @override
  State<FilterDrawer> createState() =>
      _FilterDrawerState();
}

class _FilterDrawerState
    extends State<FilterDrawer> {
  late RangeValues priceRange;

  late Set<String>
      selectedCategories;

  late Set<String>
      selectedWeights;

  final List<String> categories = [
    'All',
    'Minikit',
    'Banskathi',
    'Ratna',
    'Gobindo Bhog',
    'Basmati',
    'JEERA KATHI',
  ];

  final List<String> weights = [
    '1 Kg',
    '2 Kg',
    '5 Kg',
    '10 Kg',
    '26 Kg',
    '30 Kg',
    '40 Kg',
  ];

  @override
  void initState() {
    super.initState();

    priceRange =
        widget.initialPriceRange;

    selectedCategories =
        Set<String>.from(
      widget.initialCategories,
    );

    selectedWeights =
        Set<String>.from(
      widget.initialWeights,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width;

    return Material(
      color: Colors.white,

      child: SizedBox(
        width: screenWidth * 0.82,

        child: SafeArea(
          child: Column(
            children: [
              // HEADER
              SizedBox(
                height: 58,

                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Filters',

                          style:
                              TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },

                        icon:
                            const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(
                height: 1,
              ),

              // CONTENT
              Expanded(
                child:
                    SingleChildScrollView(
                  padding:
                      const EdgeInsets.all(
                    16,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      _sectionTitle(
                        'Categories',
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      ...categories.map(
                        (category) {
                          final isAll =
                              category ==
                                  'All';

                          final selected =
                              isAll
                                  ? selectedCategories
                                      .isEmpty
                                  : selectedCategories
                                      .contains(
                                      category,
                                    );

                          return CheckboxListTile(
                            contentPadding:
                                EdgeInsets.zero,

                            dense: true,

                            title: Text(
                              category,
                            ),

                            value: selected,

                            activeColor:
                                const Color(
                              0xFFE23F1C,
                            ),

                            onChanged:
                                (value) {
                              setState(() {
                                if (isAll) {
                                  selectedCategories
                                      .clear();
                                } else {
                                  if (selected) {
                                    selectedCategories
                                        .remove(
                                      category,
                                    );
                                  } else {
                                    selectedCategories
                                        .add(
                                      category,
                                    );
                                  }
                                }
                              });
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      _sectionTitle(
                        'Price Range',
                      ),

                      RangeSlider(
                        values:
                            priceRange,

                        min: 119,
                        max: 1649,

                        divisions: 153,

                        activeColor:
                            const Color(
                          0xFFE23F1C,
                        ),

                        labels:
                            RangeLabels(
                          '₹${priceRange.start.toInt()}',
                          '₹${priceRange.end.toInt()}',
                        ),

                        onChanged:
                            (value) {
                          setState(() {
                            priceRange =
                                value;
                          });
                        },
                      ),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [
                          Text(
                            '₹${priceRange.start.toInt()}',
                          ),

                          Text(
                            '₹${priceRange.end.toInt()}',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      _sectionTitle(
                        'Weight',
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      ...weights.map(
                        (weight) {
                          final selected =
                              selectedWeights
                                  .contains(
                            weight,
                          );

                          return CheckboxListTile(
                            contentPadding:
                                EdgeInsets.zero,

                            dense: true,

                            title: Text(
                              weight,
                            ),

                            value: selected,

                            activeColor:
                                const Color(
                              0xFFE23F1C,
                            ),

                            onChanged:
                                (value) {
                              setState(() {
                                if (selected) {
                                  selectedWeights
                                      .remove(
                                    weight,
                                  );
                                } else {
                                  selectedWeights
                                      .add(
                                    weight,
                                  );
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // BOTTOM BUTTONS
              Container(
                padding:
                    const EdgeInsets.all(
                  12,
                ),

                decoration:
                    BoxDecoration(
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black
                              .withValues(
                        alpha: 0.08,
                      ),

                      blurRadius: 8,

                      offset:
                          const Offset(
                        0,
                        -2,
                      ),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Expanded(
                      child:
                          OutlinedButton(
                        onPressed: () {
                          setState(() {
                            priceRange =
                                const RangeValues(
                              119,
                              1649,
                            );

                            selectedCategories
                                .clear();

                            selectedWeights
                                .clear();
                          });
                        },

                        child:
                            const Text(
                          'CLEAR',
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                      child:
                          ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,

                            FilterResult(
                              priceRange:
                                  priceRange,

                              categories:
                                  Set<String>.from(
                                selectedCategories,
                              ),

                              weights:
                                  Set<String>.from(
                                selectedWeights,
                              ),
                            ),
                          );
                        },

                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                            0xFFE23F1C,
                          ),

                          foregroundColor:
                              Colors.white,
                        ),

                        child:
                            const Text(
                          'APPLY FILTER',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(
    String title,
  ) {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.only(
        bottom: 7,
      ),

      decoration:
          const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                Color(0xffeeeeee),
          ),
        ),
      ),

      child: Text(
        title,

        style:
            const TextStyle(
          fontSize: 15,
          fontWeight:
              FontWeight.bold,
        ),
      ),
    );
  }
}

// ==============================================================================
// PRODUCT MODEL
// ==============================================================================

class ProductItem {
  final String name;

  final String imageUrl;

  final double rating;

  final int deliveryDays;

  final List<ProductVariant>
      variants;

  int selectedVariant;

  ProductItem({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryDays,
    required this.variants,
    this.selectedVariant = 0,
  });
}

// ==============================================================================
// PRODUCT VARIANT
// ==============================================================================

class ProductVariant {
  final String weight;

  final double price;

  ProductVariant({
    required this.weight,
    required this.price,
  });
}

