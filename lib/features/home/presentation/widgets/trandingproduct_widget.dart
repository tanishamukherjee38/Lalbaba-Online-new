

import 'package:flutter/material.dart';
import 'sectioncard_widget.dart';
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
