

import 'package:flutter/material.dart';
import 'sectioncard_widget.dart';
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
