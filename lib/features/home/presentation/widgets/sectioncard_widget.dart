import 'package:flutter/material.dart';

import 'product_card_widget.dart';

// Shared white card with a heading + horizontally scrolling product list.
// Why: Trending this week and All time Best seller are identical layouts,
// only the heading and data differ — trending_widget.dart and
// best_seller_widget.dart both wrap this so the layout lives in one place.
//
// No external model used — each product is a plain Map with keys:
// 'name' (String), 'imageUrl' (String), 'price' (String), 'rating' (double).
class SectionCardWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;

  const SectionCardWidget({
    super.key,
    required this.title,
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
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCardWidget(
                  name: product['name'] as String? ?? '',
                  imageUrl: product['imageUrl'] as String? ?? '',
                  price: product['price'] as String? ?? '',
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
