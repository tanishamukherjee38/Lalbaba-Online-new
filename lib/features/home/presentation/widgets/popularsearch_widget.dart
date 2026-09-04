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
// import 'package:flutter/material.dart';
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
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFFFFE9E0), Color(0xFFFFF3E0)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Popular Search',
//             style: TextStyle(
//               fontSize: 19,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF212121),
//             ),
//           ),
//           const SizedBox(height: 14),
//           Row(
//             children: products
//                 .map(
//                   (product) => Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: _PopularSearchTile(
//                         name: product['name'] as String? ?? '',
//                         imageUrl: product['imageUrl'] as String? ?? '',
//                         discountLabel: product['discountLabel'] as String?,
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

// class _PopularSearchTile extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final String? discountLabel;
//   final VoidCallback? onTap;

//   const _PopularSearchTile({
//     required this.name,
//     required this.imageUrl,
//     this.discountLabel,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(10),
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   height: 100,
//                   width: double.infinity,
//                   child: Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => const Icon(
//                       Icons.image_outlined,
//                       size: 32,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 if (discountLabel != null)
//                   Positioned(
//                     top: 6,
//                     left: 6,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 6, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE23F1C),
//                         borderRadius: BorderRadius.circular(3),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(Icons.arrow_downward,
//                               size: 10, color: Colors.white),
//                           Text(
//                             discountLabel!,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
//               child: Text(
//                 name,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF666666),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
//               child: Text(
//                 'Deals for you',
//                 style: TextStyle(
//                   fontSize: 12.5,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF212121),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class PopularSearchWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final ValueChanged<Map<String, dynamic>>? onProductTap;

  const PopularSearchWidget({
    super.key,
    required this.products,
    this.onProductTap,
  });

  static const Color _accent = Color(0xFFE23F1C);
  static const Color _black = Color(0xFF212121);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE9E0), Color(0xFFFFF3E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _accent.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─────────────────────────
          // HEADER
          // ─────────────────────────
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: _accent,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: _accent.withOpacity(0.35),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.local_fire_department_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Popular Search',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _black,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ─────────────────────────
          // TILES
          // ─────────────────────────
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

  static const Color _accent = Color(0xFFE23F1C);
  static const Color _black = Color(0xFF212121);
  static const Color _grey = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────
              // IMAGE + DISCOUNT BADGE
              // ─────────────────────────
              Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: const Color(0xFFF5F5F5),
                          alignment: Alignment.center,
                          child: const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(_accent),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFF5F5F5),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_outlined,
                          size: 28,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  if (discountLabel != null && discountLabel!.isNotEmpty)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2.5,
                        ),
                        decoration: BoxDecoration(
                          color: _accent,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: _accent.withOpacity(0.35),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_downward_rounded,
                              size: 10,
                              color: Colors.white,
                            ),
                            Text(
                              discountLabel!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),

              // ─────────────────────────
              // NAME + DEAL TAG
              // ─────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _grey,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _accent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Deals for you',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: _black,
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
}
