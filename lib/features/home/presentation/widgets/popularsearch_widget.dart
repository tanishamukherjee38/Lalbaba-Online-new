// import 'package:flutter/material.dart';

// import 'product_card_widget.dart';

// // "Popular Search" section — image + name only (no price/rating),
// // laid out as a row of equal-width cards.
// // Each item in `products` is a Map with keys:
// // 'name' (String), 'imageUrl' (String).
// class PopularSearchWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> products;
//   final ValueChanged<Map<String, dynamic>>? onProductTap;

//   const PopularSearchWidget({
//     super.key,
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
//           const Text(
//             'Popular Search',
//             style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             // Expanded here is safe: Row's main axis is horizontal and the
//             // Row gets a bounded WIDTH from its parent. It's only unsafe
//             // when used for an unbounded HEIGHT (see product_card_widget.dart).
//             children: products
//                 .map(
//                   (product) => Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: ProductCardWidget(
//                         name: product['name'] as String? ?? '',
//                         imageUrl: product['imageUrl'] as String? ?? '',
//                         showPriceAndRating: false,
//                         onTap: () => onProductTap?.call(product),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// Flipkart-style "Still looking for these?" section: soft gradient
// background, small square product tiles with an optional discount
// ribbon in the top-left corner, name below.
// Each item in `products` is a Map with keys:
// 'name' (String), 'imageUrl' (String), 'discountLabel' (String?, optional).
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE9E0), Color(0xFFFFF3E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Search',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: products
                .map(
                  (product) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _PopularSearchTile(
                        name: product['name'] as String? ?? '',
                        imageUrl: product['imageUrl'] as String? ?? '',
                        discountLabel: product['discountLabel'] as String?,
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

class _PopularSearchTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String? discountLabel;
  final VoidCallback? onTap;

  const _PopularSearchTile({
    required this.name,
    required this.imageUrl,
    this.discountLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_outlined,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ),
                if (discountLabel != null)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE23F1C),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.arrow_downward,
                              size: 10, color: Colors.white),
                          Text(
                            discountLabel!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                'Deals for you',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
