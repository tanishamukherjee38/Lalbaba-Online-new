

// import 'package:flutter/material.dart';
// import 'sectioncard_widget.dart';
// class TrendingWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> products;
//   final ValueChanged<Map<String, dynamic>>? onProductTap;
//   final VoidCallback? onViewAllTap;

//   const TrendingWidget({
//     super.key,
//     required this.products,
//     this.onProductTap,
//     this.onViewAllTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SectionCardWidget(
//       title: 'Trending this week',
//       products: products,
//       onProductTap: onProductTap,
//       onViewAllTap: onViewAllTap,
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../account/presentation/widgets/app_string.dart';
import 'sectioncard_widget.dart';

class TrendingWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  final ValueChanged<Map<String, dynamic>>?
      onProductTap;

  final void Function(
    Map<String, dynamic> product,
  )? onAddToCart;

  final VoidCallback? onViewAllTap;

  const TrendingWidget({
    super.key,
    required this.products,
    this.onProductTap,
    this.onAddToCart,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCardWidget(
      title: AppStrings.trendingThisWeek,
      products: products,
      onProductTap: onProductTap,
      onAddToCart: onAddToCart,
      onViewAllTap: onViewAllTap,
    );
  }
}