// import 'package:flutter/material.dart';


// import 'sectioncard_widget.dart';

// // "Trending this week" section.
// // Each item in `products` is a Map with keys:
// // 'name' (String), 'imageUrl' (String), 'price' (String), 'rating' (double).
// class TrendingWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> products;
//   final ValueChanged<Map<String, dynamic>>? onProductTap;

//   const TrendingWidget({
//     super.key,
//     required this.products,
//     this.onProductTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SectionCardWidget(
//       title: 'Trending this week',
//       products: products,
//       onProductTap: onProductTap,
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'sectioncard_widget.dart';

// "Trending this week" section — Flipkart card style.
// Each item in `products` is a Map with keys:
// 'name', 'imageUrl', 'price', 'originalPrice', 'discountLabel', 'rating'.
class TrendingWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;
  final VoidCallback? onViewAllTap;

  const TrendingWidget({
    super.key,
    required this.products,
    this.onProductTap,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCardWidget(
      title: 'Trending this week',
      products: products,
      onProductTap: onProductTap,
      onViewAllTap: onViewAllTap,
    );
  }
}
