// import 'package:flutter/material.dart';


// import 'sectioncard_widget.dart';

// // "All time Best seller" section — same layout as TrendingWidget,
// // only the heading and data differ.
// // Each item in `products` is a Map with keys:
// // 'name' (String), 'imageUrl' (String), 'price' (String), 'rating' (double).
// class BestSellerWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> products;
//   final ValueChanged<Map<String, dynamic>>? onProductTap;

//   const BestSellerWidget({
//     super.key,
//     required this.products,
//     this.onProductTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SectionCardWidget(
//       title: 'All time Best seller',
//       products: products,
//       onProductTap: onProductTap,
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'sectioncard_widget.dart';

// "All time Best seller" section — same Flipkart card style as
// TrendingWidget, only the heading and data differ.
class BestSellerWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;
  final VoidCallback? onViewAllTap;

  const BestSellerWidget({
    super.key,
    required this.products,
    this.onProductTap,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCardWidget(
      title: 'All time Best seller',
      products: products,
      onProductTap: onProductTap,
      onViewAllTap: onViewAllTap,
    );
  }
}
