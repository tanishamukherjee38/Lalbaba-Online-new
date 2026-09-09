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
//   final VoidCallback? onAddToCart;
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
//     this.onAddToCart,
//     this.width = 150,
//     this.imageHeight = 105,
//   });

//   static const Color accentColor = Color(0xFFE23F1C);
//   static const Color _ratingGreen = Color(0xFF2E7D32);
//   static const Color _black = Color(0xFF212121);
//   static const Color _grey = Color(0xFF878787);
//   static const Color _imageBg = Color(0xFFFAFAFA);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(14),
//         child: Container(
//           width: width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: const Color(0xFFF0F0F0)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           clipBehavior: Clip.antiAlias,

//           // IMPORTANT:
//           // max allows Expanded to use the available card height
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ============================================================
//               // IMAGE
//               // ============================================================
//               SizedBox(
//                 height: imageHeight,
//                 width: double.infinity,
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Container(
//                         color: _imageBg,
//                         padding: const EdgeInsets.all(10),
//                         child: Image.network(
//                           imageUrl,
//                           fit: BoxFit.contain,
//                           loadingBuilder: (context, child, loadingProgress) {
//                             if (loadingProgress == null) {
//                               return child;
//                             }

//                             return const Center(
//                               child: SizedBox(
//                                 width: 18,
//                                 height: 18,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     accentColor,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stackTrace) {
//                             return const Center(
//                               child: Icon(
//                                 Icons.image_outlined,
//                                 size: 32,
//                                 color: Colors.grey,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),

//                     // ------------------------------------------------------
//                     // DISCOUNT BADGE
//                     // ------------------------------------------------------
//                     if (discountLabel != null && discountLabel!.isNotEmpty)
//                       Positioned(
//                         top: 8,
//                         left: 8,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 6,
//                             vertical: 3,
//                           ),
//                           decoration: BoxDecoration(
//                             color: accentColor,
//                             borderRadius: BorderRadius.circular(6),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: accentColor.withValues(alpha: 0.35),
//                                 blurRadius: 4,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Text(
//                             discountLabel!,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),

//               // ============================================================
//               // PRODUCT INFORMATION
//               //
//               // Expanded is the important part.
//               // It takes whatever height is left between image and button.
//               // ============================================================
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 7, 10, 3),
//                   child: showPriceAndRating
//                       ? Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // ------------------------------------------------
//                             // PRODUCT NAME
//                             // Fixed 2-line area.
//                             // ------------------------------------------------
//                             SizedBox(
//                               height: 32,
//                               width: double.infinity,
//                               child: Text(
//                                 name,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 12.5,
//                                   fontWeight: FontWeight.w600,
//                                   color: _black,
//                                   height: 1.25,
//                                 ),
//                               ),
//                             ),

//                             const SizedBox(height: 4),

//                             // ------------------------------------------------
//                             // RATING
//                             // Fixed height so missing rating doesn't move
//                             // the price/button.
//                             // ------------------------------------------------
//                             SizedBox(
//                               height: 20,
//                               width: double.infinity,
//                               child: rating > 0
//                                   ? Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Container(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 5,
//                                           vertical: 2,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: _ratingGreen,
//                                           borderRadius: BorderRadius.circular(
//                                             4,
//                                           ),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Text(
//                                               rating.toStringAsFixed(1),
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10.5,
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 2),
//                                             const Icon(
//                                               Icons.star_rounded,
//                                               size: 11,
//                                               color: Colors.white,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   : const SizedBox.shrink(),
//                             ),

//                             const SizedBox(height: 4),

//                             // ------------------------------------------------
//                             // PRICE
//                             // Fixed height.
//                             // ------------------------------------------------
//                             SizedBox(
//                               height: 23,
//                               width: double.infinity,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   if (price.isNotEmpty)
//                                     Flexible(
//                                       child: Text(
//                                         price,
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: const TextStyle(
//                                           fontSize: 14.5,
//                                           fontWeight: FontWeight.w800,
//                                           color: _black,
//                                         ),
//                                       ),
//                                     ),

//                                   if (price.isNotEmpty &&
//                                       originalPrice != null &&
//                                       originalPrice!.isNotEmpty)
//                                     const SizedBox(width: 6),

//                                   if (originalPrice != null &&
//                                       originalPrice!.isNotEmpty)
//                                     Flexible(
//                                       child: Text(
//                                         originalPrice!,
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: const TextStyle(
//                                           fontSize: 11,
//                                           color: _grey,
//                                           decoration:
//                                               TextDecoration.lineThrough,
//                                           decorationColor: _grey,
//                                         ),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                       : Align(
//                           alignment: Alignment.topCenter,
//                           child: SizedBox(
//                             width: double.infinity,
//                             height: 36,
//                             child: Text(
//                               name,
//                               textAlign: TextAlign.center,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color: _black,
//                                 height: 1.25,
//                               ),
//                             ),
//                           ),
//                         ),
//                 ),
//               ),

//               // ============================================================
//               // ADD TO CART
//               //
//               // This section is NOT inside Expanded.
//               // Therefore its position stays fixed at the bottom.
//               // ============================================================
//               if (onAddToCart != null)
//                 SizedBox(
//                   height: 38,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(8, 1, 8, 7),
//                     child: SizedBox(
//                       width: double.infinity,
//                       height: 30,
//                       child: ElevatedButton(
//                         onPressed: onAddToCart,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: accentColor,
//                           foregroundColor: Colors.white,
//                           elevation: 0,
//                           minimumSize: Size.zero,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 4,
//                             vertical: 0,
//                           ),
//                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: const [
//                               Icon(Icons.add_shopping_cart_rounded, size: 14),
//                               SizedBox(width: 5),
//                               Text(
//                                 'Add to Cart',
//                                 maxLines: 1,
//                                 softWrap: false,
//                                 overflow: TextOverflow.clip,
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w700,
//                                   letterSpacing: 0.1,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_shimmer.dart';

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
            border: Border.all(
              color: const Color(0xFFF0F0F0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===============================================================
              // PRODUCT IMAGE
              // ===============================================================

              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: _imageBg,
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,

                          // ===================================================
                          // SHIMMER WHILE IMAGE IS LOADING
                          // ===================================================

                          loadingBuilder: (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return AppShimmer(
                              width: double.infinity,
                              height: imageHeight,
                              radius: 10,
                            );
                          },

                          // ===================================================
                          // IMAGE ERROR
                          // ===================================================

                          errorBuilder: (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) {
                            return const Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 32,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // =========================================================
                    // DISCOUNT BADGE
                    // =========================================================

                    if (discountLabel != null &&
                        discountLabel!.isNotEmpty)
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
                                color: accentColor.withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            discountLabel!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
              ),

              // ===============================================================
              // PRODUCT INFORMATION
              // ===============================================================

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    7,
                    10,
                    3,
                  ),
                  child: showPriceAndRating
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            // =================================================
                            // PRODUCT NAME
                            // =================================================

                            SizedBox(
                              height: 32,
                              width: double.infinity,
                              child: Text(
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
                            ),

                            const SizedBox(height: 4),

                            // =================================================
                            // RATING
                            // =================================================

                            SizedBox(
                              height: 20,
                              width: double.infinity,
                              child: rating > 0
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _ratingGreen,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                              MainAxisSize.min,
                                          children: [
                                            Text(
                                              rating.toStringAsFixed(
                                                1,
                                              ),
                                              style:
                                                  const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.5,
                                                fontWeight:
                                                    FontWeight.w700,
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
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            const SizedBox(height: 4),

                            // =================================================
                            // PRICE
                            // =================================================

                            SizedBox(
                              height: 23,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  if (price.isNotEmpty)
                                    Flexible(
                                      child: Text(
                                        price,
                                        maxLines: 1,
                                        overflow:
                                            TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14.5,
                                          fontWeight:
                                              FontWeight.w800,
                                          color: _black,
                                        ),
                                      ),
                                    ),

                                  if (price.isNotEmpty &&
                                      originalPrice != null &&
                                      originalPrice!.isNotEmpty)
                                    const SizedBox(width: 6),

                                  if (originalPrice != null &&
                                      originalPrice!.isNotEmpty)
                                    Flexible(
                                      child: Text(
                                        originalPrice!,
                                        maxLines: 1,
                                        overflow:
                                            TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: _grey,
                                          decoration:
                                              TextDecoration
                                                  .lineThrough,
                                          decorationColor: _grey,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 36,
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _black,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                ),
              ),

              // ===============================================================
              // ADD TO CART BUTTON
              // ===============================================================

              if (onAddToCart != null)
                SizedBox(
                  height: 38,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      8,
                      1,
                      8,
                      7,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: onAddToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 0,
                          ),
                          tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8),
                          ),
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 14,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Add to Cart',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.clip,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}