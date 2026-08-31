import 'package:flutter/material.dart';

import 'product_card_widget.dart';

// "Popular Search" section — image + name only (no price/rating),
// laid out as a row of equal-width cards.
// Each item in `products` is a Map with keys:
// 'name' (String), 'imageUrl' (String).
class PopularSearchWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;

  const PopularSearchWidget({
    super.key,
    required this.products,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Search',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            // Expanded here is safe: Row's main axis is horizontal and the
            // Row gets a bounded WIDTH from its parent. It's only unsafe
            // when used for an unbounded HEIGHT (see product_card_widget.dart).
            children: products
                .map(
                  (product) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ProductCardWidget(
                        name: product['name'] as String? ?? '',
                        imageUrl: product['imageUrl'] as String? ?? '',
                        showPriceAndRating: false,
                        onTap: () => onProductTap?.call(product),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
