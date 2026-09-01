// import 'package:flutter/material.dart';

// import 'product_card_widget.dart';

// // Shared white card with a heading + horizontally scrolling product list.
// // Why: Trending this week and All time Best seller are identical layouts,
// // only the heading and data differ — trending_widget.dart and
// // best_seller_widget.dart both wrap this so the layout lives in one place.
// //
// // No external model used — each product is a plain Map with keys:
// // 'name' (String), 'imageUrl' (String), 'price' (String), 'rating' (double).
// class SectionCardWidget extends StatelessWidget {
//   final String title;
//   final List<Map<String, dynamic>> products;
//   final ValueChanged<Map<String, dynamic>>? onProductTap;

//   const SectionCardWidget({
//     super.key,
//     required this.title,
//     required this.products,
//     this.onProductTap,
//   });

//   @override
//   Widget build(BuildContext context) {
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
//             height: 210,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: products.length,
//               separatorBuilder: (_, __) => const SizedBox(width: 12),
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ProductCardWidget(
//                   name: product['name'] as String? ?? '',
//                   imageUrl: product['imageUrl'] as String? ?? '',
//                   price: product['price'] as String? ?? '',
//                   rating: (product['rating'] as num?)?.toDouble() ?? 0,
//                   showPriceAndRating: true,
//                   onTap: () => onProductTap?.call(product),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'product_card_widget.dart';

// Flipkart-style section: bold heading + "View All >" link on the right,
// then a horizontally scrolling row of product cards on a white card.
// Each item in `products` is a Map with keys:
// 'name', 'imageUrl', 'price', 'originalPrice', 'discountLabel', 'rating'.
class SectionCardWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;
  final VoidCallback? onViewAllTap;

  const SectionCardWidget({
    super.key,
    required this.title,
    required this.products,
    this.onProductTap,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121),
                  ),
                ),
                InkWell(
                  onTap: onViewAllTap,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE23F1C),
                        ),
                      ),
                      Icon(Icons.chevron_right,
                          size: 18, color: Color(0xFFE23F1C)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 225,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCardWidget(
                  name: product['name'] as String? ?? '',
                  imageUrl: product['imageUrl'] as String? ?? '',
                  price: product['price'] as String? ?? '',
                  originalPrice: product['originalPrice'] as String?,
                  discountLabel: product['discountLabel'] as String?,
                  rating: (product['rating'] as num?)?.toDouble() ?? 0,
                  showPriceAndRating: true,
                  onTap: () => onProductTap?.call(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
