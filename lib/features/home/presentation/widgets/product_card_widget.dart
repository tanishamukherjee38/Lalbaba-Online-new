// import 'package:flutter/material.dart';

// // Single product card — reused by trending_widget.dart,
// // popular_search_widget.dart, and best_seller_widget.dart.
// // No external model used — just plain fields (name, imageUrl, price,
// // rating) so this file has zero dependency on anything under core/models.
// //
// // IMPORTANT LAYOUT NOTE:
// // The inner Column uses `mainAxisSize: MainAxisSize.min` and a fixed-height
// // SizedBox for the image instead of Expanded. Expanded only works when the
// // parent gives a bounded height, which a Row/Column inside a ListView
// // (shrink-wrapped) does NOT provide — using Expanded there caused the
// // "RenderFlex children have non-zero flex but incoming height constraints
// // are unbounded" crash. Keep it this way.
// class ProductCardWidget extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final double rating;
//   final bool showPriceAndRating;
//   final VoidCallback? onTap;
//   final double width;
//   final double imageHeight;

//   const ProductCardWidget({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//     this.price = '',
//     this.rating = 0,
//     this.showPriceAndRating = false,
//     this.onTap,
//     this.width = 130,
//     this.imageHeight = 110,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: width,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: imageHeight,
//               width: double.infinity,
//               child: Container(
//                 color: Colors.grey.shade100,
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, progress) {
//                     if (progress == null) return child;
//                     return const Center(
//                       child: SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) => const Icon(
//                     Icons.image_outlined,
//                     size: 40,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//             if (showPriceAndRating)
//               Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                     const SizedBox(height: 2),
//                     if (rating > 0)
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(Icons.star,
//                               size: 12, color: Colors.orange),
//                           Text(
//                             ' $rating',
//                             style: const TextStyle(fontSize: 11),
//                           ),
//                         ],
//                       ),
//                     Text(
//                       price,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             else
//               Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: Text(
//                   name,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style:
//                       const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ProductCardWidget extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final String? originalPrice; // e.g. "₹1,299.00" (shown struck through)
//   final String? discountLabel; // e.g. "16% off"
//   final double rating;
//   final bool showPriceAndRating;
//   final VoidCallback? onTap;
//   final double width;
//   final double imageHeight;

//   const ProductCardWidget({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//     this.price = '',
//     this.originalPrice,
//     this.discountLabel,
//     this.rating = 0,
//     this.showPriceAndRating = false,
//     this.onTap,
//     this.width = 150,
//     this.imageHeight = 120,
//   });

//   static const Color accentColor = Color(0xFFE23F1C);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: const Color(0xFFF0F0F0)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: imageHeight,
//               width: double.infinity,
//               child: Container(
//                 color: const Color(0xFFFAFAFA),
//                 padding: const EdgeInsets.all(8),
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, progress) {
//                     if (progress == null) return child;
//                     return const Center(
//                       child: SizedBox(
//                         width: 18,
//                         height: 18,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) => const Icon(
//                     Icons.image_outlined,
//                     size: 36,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//             if (showPriceAndRating)
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 12.5,
//                         color: Color(0xFF212121),
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     if (rating > 0)
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 5, vertical: 1),
//                         decoration: BoxDecoration(
//                           color: accentColor,
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '$rating',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(width: 2),
//                             const Icon(Icons.star,
//                                 size: 10, color: Colors.white),
//                           ],
//                         ),
//                       ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           price,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF212121),
//                           ),
//                         ),
//                         if (originalPrice != null) ...[
//                           const SizedBox(width: 6),
//                           Text(
//                             originalPrice!,
//                             style: const TextStyle(
//                               fontSize: 11,
//                               color: Color(0xFF878787),
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                     if (discountLabel != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 2),
//                         child: Text(
//                           discountLabel!,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: accentColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               )
//             else
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Text(
//                   name,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF212121),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ProductCardWidget extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final String? originalPrice;
//   final String? discountLabel;
//   final double rating;
//   final bool showPriceAndRating;
//   final VoidCallback? onTap;
//   final double width;
//   final double imageHeight;

//   const ProductCardWidget({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//     this.price = '',
//     this.originalPrice,
//     this.discountLabel,
//     this.rating = 0,
//     this.showPriceAndRating = false,
//     this.onTap,
//     this.width = 150,

//     // Reduced from 120 to 105 to prevent vertical overflow
//     this.imageHeight = 105,
//   });

//   static const Color accentColor = Color(0xFFE23F1C);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: const Color(0xFFF0F0F0)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             SizedBox(
//               height: imageHeight,
//               width: double.infinity,
//               child: Container(
//                 color: const Color(0xFFFAFAFA),
//                 padding: const EdgeInsets.all(8),
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, progress) {
//                     if (progress == null) {
//                       return child;
//                     }

//                     return const Center(
//                       child: SizedBox(
//                         width: 18,
//                         height: 18,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Icon(
//                       Icons.image_outlined,
//                       size: 36,
//                       color: Colors.grey,
//                     );
//                   },
//                 ),
//               ),
//             ),

//             // Product Information
//             if (showPriceAndRating)
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 4, 8, 6),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Product Name
//                     Text(
//                       name,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 12.5,
//                         color: Color(0xFF212121),
//                       ),
//                     ),

//                     const SizedBox(height: 3),

//                     // Rating
//                     if (rating > 0)
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 5,
//                           vertical: 1,
//                         ),
//                         decoration: BoxDecoration(
//                           color: accentColor,
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               '$rating',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(width: 2),
//                             const Icon(
//                               Icons.star,
//                               size: 10,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),

//                     const SizedBox(height: 3),

//                     // Price
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Flexible(
//                           child: Text(
//                             price,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF212121),
//                             ),
//                           ),
//                         ),

//                         if (originalPrice != null) ...[
//                           const SizedBox(width: 6),
//                           Flexible(
//                             child: Text(
//                               originalPrice!,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 11,
//                                 color: Color(0xFF878787),
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),

//                     // Discount
//                     if (discountLabel != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 1),
//                         child: Text(
//                           discountLabel!,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: accentColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               )
//             else
//               // Product Name Only
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Text(
//                   name,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF212121),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String? originalPrice;
  final String? discountLabel;
  final double rating;
  final bool showPriceAndRating;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final double width;
  final double imageHeight;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    this.price = '',
    this.originalPrice,
    this.discountLabel,
    this.rating = 0,
    this.showPriceAndRating = false,
    this.onTap,
    this.onAddToCart,
    this.width = 150,

    // Reduced from 120 to 105 to prevent vertical overflow
    this.imageHeight = 105,
  });

  static const Color accentColor = Color(0xFFE23F1C);
  static const Color _ratingGreen = Color(0xFF2E7D32);
  static const Color _black = Color(0xFF212121);
  static const Color _grey = Color(0xFF878787);
  static const Color _imageBg = Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFF0F0F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
              // PRODUCT IMAGE + DISCOUNT BADGE
              // ─────────────────────────
              Stack(
                children: [
                  SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: Container(
                      color: _imageBg,
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  accentColor,
                                ),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image_outlined,
                            size: 32,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                  if (discountLabel != null && discountLabel!.isNotEmpty)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.35),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          discountLabel!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              // ─────────────────────────
              // PRODUCT INFORMATION
              // ─────────────────────────
              if (showPriceAndRating)
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: _black,
                          height: 1.25,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Rating
                      if (rating > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _ratingGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Icon(
                                Icons.star_rounded,
                                size: 11,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),

                      const SizedBox(height: 6),

                      // Price
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w800,
                                color: _black,
                              ),
                            ),
                          ),
                          if (originalPrice != null &&
                              originalPrice!.isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                originalPrice!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: _grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: _grey,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),

                      // Add to Cart
                      if (onAddToCart != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: onAddToCart,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              // FittedBox guarantees the icon + label
                              // always sit on ONE line — it scales
                              // the whole row down to fit the
                              // available width instead of letting
                              // the text wrap onto a second line.
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.add_shopping_cart_rounded,
                                      size: 14,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              else
                // Product Name Only
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
