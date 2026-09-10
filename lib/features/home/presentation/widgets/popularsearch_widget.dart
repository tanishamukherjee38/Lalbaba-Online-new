
// // import 'package:flutter/material.dart';

// // class PopularSearchWidget extends StatelessWidget {
// //   final List<Map<String, dynamic>> products;
// //   final ValueChanged<Map<String, dynamic>>? onProductTap;

// //   const PopularSearchWidget({
// //     super.key,
// //     required this.products,
// //     this.onProductTap,
// //   });

// //   static const Color _accent = AppColors.primary;
// //   static const Color _black = Color(0xFF212121);

// //   @override
// //   Widget build(BuildContext context) {
// //     if (products.isEmpty) {
// //       return const SizedBox.shrink();
// //     }

// //     return Container(
// //       margin: const EdgeInsets.symmetric(
// //         horizontal: 8,
// //         vertical: 6,
// //       ),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         gradient: const LinearGradient(
// //           colors: [
// //             Color(0xFFFFE9E0),
// //             Color(0xFFFFF3E0),
// //           ],
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: [
// //           BoxShadow(
// //             color: _accent.withValues(alpha: 0.08),
// //             blurRadius: 12,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // HEADER
// //           Row(
// //             children: [
// //               Container(
// //                 width: 30,
// //                 height: 30,
// //                 decoration: BoxDecoration(
// //                   color: _accent,
// //                   borderRadius: BorderRadius.circular(9),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: _accent.withValues(alpha: 0.35),
// //                       blurRadius: 6,
// //                       offset: const Offset(0, 3),
// //                     ),
// //                   ],
// //                 ),
// //                 child: const Icon(
// //                   Icons.local_fire_department_rounded,
// //                   color: AppColors.primaryLight,
// //                   size: 18,
// //                 ),
// //               ),
// //               const SizedBox(width: 10),
// //               const Text(
// //                 'Popular Search',
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: _black,
// //                   letterSpacing: 0.1,
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 14),

// //           // TILES
// //           Row(
// //             children: products
// //                 .map(
// //                   (product) => Expanded(
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(right: 12),
// //                       child: _PopularSearchTile(
// //                         name: product['name'] as String? ?? '',
// //                         imageUrl: product['imageUrl'] as String? ?? '',
// //                         discountLabel:
// //                             product['discountLabel'] as String?,
// //                         onTap: () {
// //                           onProductTap?.call(product);
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 )
// //                 .toList(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _PopularSearchTile extends StatelessWidget {
// //   final String name;
// //   final String imageUrl;
// //   final String? discountLabel;
// //   final VoidCallback? onTap;

// //   const _PopularSearchTile({
// //     required this.name,
// //     required this.imageUrl,
// //     this.discountLabel,
// //     this.onTap,
// //   });

// //   static const Color _accent = AppColors.primary;
// //   static const Color _black = Color(0xFF212121);
// //   static const Color _grey = Color(0xFF666666);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: Colors.transparent,
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(14),
// //         onTap: onTap,
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: AppColors.primaryLight,
// //             borderRadius: BorderRadius.circular(14),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withValues(alpha: 0.06),
// //                 blurRadius: 10,
// //                 offset: const Offset(0, 4),
// //               ),
// //             ],
// //           ),
// //           clipBehavior: Clip.antiAlias,
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // IMAGE + DISCOUNT BADGE
// //               Stack(
// //                 children: [
// //                   SizedBox(
// //                     height: 100,
// //                     width: double.infinity,
// //                     child: Image.network(
// //                       imageUrl,
// //                       fit: BoxFit.cover,

// //                       // Loader removed
// //                       loadingBuilder: (
// //                         BuildContext context,
// //                         Widget child,
// //                         ImageChunkEvent? progress,
// //                       ) {
// //                         if (progress == null) {
// //                           return child;
// //                         }

// //                         return Container(
// //                           width: double.infinity,
// //                           height: double.infinity,
// //                           color: const Color(0xFFF5F5F5),
// //                         );
// //                       },

// //                       errorBuilder: (
// //                         BuildContext context,
// //                         Object error,
// //                         StackTrace? stackTrace,
// //                       ) {
// //                         return Container(
// //                           width: double.infinity,
// //                           height: double.infinity,
// //                           color: const Color(0xFFF5F5F5),
// //                           alignment: Alignment.center,
// //                           child: const Icon(
// //                             Icons.image_outlined,
// //                             size: 28,
// //                             color: Colors.grey,
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),

// //                   if (discountLabel != null &&
// //                       discountLabel!.isNotEmpty)
// //                     Positioned(
// //                       top: 6,
// //                       left: 6,
// //                       child: Container(
// //                         padding: const EdgeInsets.symmetric(
// //                           horizontal: 6,
// //                           vertical: 2.5,
// //                         ),
// //                         decoration: BoxDecoration(
// //                           color: _accent,
// //                           borderRadius: BorderRadius.circular(5),
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: _accent.withValues(
// //                                 alpha: 0.35,
// //                               ),
// //                               blurRadius: 4,
// //                               offset: const Offset(0, 2),
// //                             ),
// //                           ],
// //                         ),
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: [
// //                             const Icon(
// //                               Icons.arrow_downward_rounded,
// //                               size: 10,
// //                               color: AppColors.primaryLight,
// //                             ),
// //                             Text(
// //                               discountLabel!,
// //                               style: const TextStyle(
// //                                 color: AppColors.primaryLight,
// //                                 fontSize: 10,
// //                                 fontWeight: FontWeight.w700,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                 ],
// //               ),

// //               // NAME + DEAL TAG
// //               Padding(
// //                 padding: const EdgeInsets.fromLTRB(
// //                   8,
// //                   8,
// //                   8,
// //                   8,
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       name,
// //                       maxLines: 1,
// //                       overflow: TextOverflow.ellipsis,
// //                       style: const TextStyle(
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.w500,
// //                         color: _grey,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 3),
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                         horizontal: 6,
// //                         vertical: 2,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: _accent.withValues(alpha: 0.1),
// //                         borderRadius: BorderRadius.circular(5),
// //                       ),
// //                       child: const Text(
// //                         'Deals for you',
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: TextStyle(
// //                           fontSize: 11.5,
// //                           fontWeight: FontWeight.w700,
// //                           color: _black,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';

// class PopularSearchWidget
//     extends StatelessWidget {
//   final List<Map<String, dynamic>>
//       products;

//   final ValueChanged<
//       Map<String, dynamic>>? onProductTap;

//   const PopularSearchWidget({
//     super.key,
//     required this.products,
//     this.onProductTap,
//   });

//   static const Color _accent =
//       AppColors.primary;

//   static const Color _black =
//       Color(0xFF212121);

//   static const double _gap = 12;

//   @override
//   Widget build(BuildContext context) {
//     if (products.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return LayoutBuilder(
//       builder: (
//         context,
//         constraints,
//       ) {
//         final double availableWidth =
//             constraints.maxWidth > 0
//                 ? constraints.maxWidth
//                 : MediaQuery.sizeOf(
//                     context,
//                   ).width;

//         // Outer margin = 16 total
//         // Inner padding = 32 total
//         final double usableWidth =
//             availableWidth - 48;

//         final double twoTileWidth =
//             (usableWidth - _gap) / 2;

//         // Choto phone-e tile squeeze korbe na.
//         final double tileWidth =
//             twoTileWidth
//                 .clamp(
//                   140.0,
//                   190.0,
//                 )
//                 .toDouble();

//         return Container(
//           margin:
//               const EdgeInsets.symmetric(
//             horizontal: 8,
//             vertical: 6,
//           ),
//           padding:
//               const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient:
//                 const LinearGradient(
//               colors: [
//                 Color(0xFFFFE9E0),
//                 Color(0xFFFFF3E0),
//               ],
//               begin:
//                   Alignment.topLeft,
//               end:
//                   Alignment.bottomRight,
//             ),
//             borderRadius:
//                 BorderRadius.circular(
//               16,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: _accent
//                     .withValues(
//                   alpha: 0.08,
//                 ),
//                 blurRadius: 12,
//                 offset:
//                     const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               // ============================================================
//               // HEADER
//               // ============================================================

//               Row(
//                 children: [
//                   Container(
//                     width: 30,
//                     height: 30,
//                     decoration:
//                         BoxDecoration(
//                       color: _accent,
//                       borderRadius:
//                           BorderRadius
//                               .circular(
//                         9,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: _accent
//                               .withValues(
//                             alpha: 0.35,
//                           ),
//                           blurRadius: 6,
//                           offset:
//                               const Offset(
//                             0,
//                             3,
//                           ),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons
//                           .local_fire_department_rounded,
//                       color:
//                           AppColors.primaryLight,
//                       size: 18,
//                     ),
//                   ),

//                   const SizedBox(
//                     width: 10,
//                   ),

//                   const Expanded(
//                     child: Text(
//                       'Popular Search',
//                       style:
//                           TextStyle(
//                         fontSize: 18,
//                         fontWeight:
//                             FontWeight
//                                 .bold,
//                         color: _black,
//                         letterSpacing:
//                             0.1,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(
//                 height: 14,
//               ),

//               // ============================================================
//               // RESPONSIVE PRODUCT TILES
//               // ============================================================

//               SizedBox(
//                 height: 165,
//                 child:
//                     ListView.separated(
//                   scrollDirection:
//                       Axis.horizontal,
//                   physics:
//                       const BouncingScrollPhysics(),

//                   itemCount:
//                       products.length,

//                   separatorBuilder:
//                       (
//                     context,
//                     index,
//                   ) {
//                     return const SizedBox(
//                       width: _gap,
//                     );
//                   },

//                   itemBuilder:
//                       (
//                     context,
//                     index,
//                   ) {
//                     final product =
//                         products[index];

//                     return SizedBox(
//                       width: tileWidth,
//                       child:
//                           _PopularSearchTile(
//                         name: product[
//                                     'name']
//                                 ?.toString() ??
//                             '',
//                         imageUrl: product[
//                                     'imageUrl']
//                                 ?.toString() ??
//                             '',
//                         discountLabel:
//                             product[
//                                     'discountLabel']
//                                 ?.toString(),
//                         onTap: () {
//                           onProductTap
//                               ?.call(
//                             product,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// // =============================================================================
// // POPULAR SEARCH TILE
// // =============================================================================

// class _PopularSearchTile
//     extends StatelessWidget {
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

//   static const Color _accent =
//       AppColors.primary;

//   static const Color _black =
//       Color(0xFF212121);

//   static const Color _grey =
//       Color(0xFF666666);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius:
//             BorderRadius.circular(14),
//         onTap: onTap,
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: AppColors.primaryLight,
//             borderRadius:
//                 BorderRadius.circular(
//               14,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black
//                     .withValues(
//                   alpha: 0.06,
//                 ),
//                 blurRadius: 10,
//                 offset:
//                     const Offset(0, 4),
//               ),
//             ],
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               // ============================================================
//               // IMAGE + DISCOUNT BADGE
//               // ============================================================

//               Expanded(
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     _buildImage(),

//                     if (discountLabel !=
//                             null &&
//                         discountLabel!
//                             .trim()
//                             .isNotEmpty)
//                       Positioned(
//                         top: 6,
//                         left: 6,
//                         child: Container(
//                           padding:
//                               const EdgeInsets
//                                   .symmetric(
//                             horizontal: 6,
//                             vertical: 3,
//                           ),
//                           decoration:
//                               BoxDecoration(
//                             color:
//                                 _accent,
//                             borderRadius:
//                                 BorderRadius
//                                     .circular(
//                               5,
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color:
//                                     _accent
//                                         .withValues(
//                                   alpha: 0.35,
//                                 ),
//                                 blurRadius: 4,
//                                 offset:
//                                     const Offset(
//                                   0,
//                                   2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             mainAxisSize:
//                                 MainAxisSize
//                                     .min,
//                             children: [
//                               const Icon(
//                                 Icons
//                                     .arrow_downward_rounded,
//                                 size: 10,
//                                 color:
//                                     AppColors.primaryLight,
//                               ),
//                               const SizedBox(
//                                 width: 1,
//                               ),
//                               Text(
//                                 discountLabel!,
//                                 maxLines: 1,
//                                 overflow:
//                                     TextOverflow
//                                         .fade,
//                                 softWrap:
//                                     false,
//                                 style:
//                                     const TextStyle(
//                                   color:
//                                       AppColors.primaryLight,
//                                   fontSize:
//                                       10,
//                                   fontWeight:
//                                       FontWeight
//                                           .w700,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),

//               // ============================================================
//               // NAME + DEAL
//               // ============================================================

//               Padding(
//                 padding:
//                     const EdgeInsets.fromLTRB(
//                   8,
//                   7,
//                   8,
//                   8,
//                 ),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment
//                           .start,
//                   children: [
//                     Text(
//                       name,

//                       // 1 line + ellipsis na.
//                       // 2 line porjonto naturally wrap.
//                       maxLines: 2,
//                       overflow:
//                           TextOverflow.fade,
//                       softWrap: true,

//                       style:
//                           const TextStyle(
//                         fontSize: 12,
//                         fontWeight:
//                             FontWeight
//                                 .w500,
//                         color: _grey,
//                         height: 1.2,
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 4,
//                     ),

//                     Container(
//                       padding:
//                           const EdgeInsets
//                               .symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration:
//                           BoxDecoration(
//                         color: _accent
//                             .withValues(
//                           alpha: 0.1,
//                         ),
//                         borderRadius:
//                             BorderRadius
//                                 .circular(
//                           5,
//                         ),
//                       ),
//                       child:
//                           const FittedBox(
//                         fit:
//                             BoxFit.scaleDown,
//                         alignment: Alignment
//                             .centerLeft,
//                         child: Text(
//                           'Deals for you',
//                           maxLines: 1,
//                           style:
//                               TextStyle(
//                             fontSize:
//                                 11.5,
//                             fontWeight:
//                                 FontWeight
//                                     .w700,
//                             color:
//                                 _black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImage() {
//     if (imageUrl.trim().isEmpty) {
//       return Container(
//         color:
//             const Color(0xFFF5F5F5),
//         alignment: Alignment.center,
//         child: const Icon(
//           Icons.image_outlined,
//           size: 28,
//           color: Colors.grey,
//         ),
//       );
//     }

//     final bool isNetwork =
//         imageUrl.startsWith(
//           'http://',
//         ) ||
//         imageUrl.startsWith(
//           'https://',
//         );

//     if (isNetwork) {
//       return Image.network(
//         imageUrl,
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: double.infinity,
//         loadingBuilder: (
//           BuildContext context,
//           Widget child,
//           ImageChunkEvent? progress,
//         ) {
//           if (progress == null) {
//             return child;
//           }

//           return Container(
//             color: const Color(
//               0xFFF5F5F5,
//             ),
//           );
//         },
//         errorBuilder: (
//           BuildContext context,
//           Object error,
//           StackTrace? stackTrace,
//         ) {
//           return Container(
//             color: const Color(
//               0xFFF5F5F5,
//             ),
//             alignment:
//                 Alignment.center,
//             child: const Icon(
//               Icons.image_outlined,
//               size: 28,
//               color: Colors.grey,
//             ),
//           );
//         },
//       );
//     }

//     return Image.asset(
//       imageUrl,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       errorBuilder: (
//         context,
//         error,
//         stackTrace,
//       ) {
//         return Container(
//           color:
//               const Color(0xFFF5F5F5),
//           alignment:
//               Alignment.center,
//           child: const Icon(
//             Icons.image_outlined,
//             size: 28,
//             color: Colors.grey,
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../account/presentation/widgets/app_string.dart';

class PopularSearchWidget
    extends StatelessWidget {
  final List<Map<String, dynamic>>
      products;

  final ValueChanged<
      Map<String, dynamic>>? onProductTap;

  const PopularSearchWidget({
    super.key,
    required this.products,
    this.onProductTap,
  });

  static const Color _accent =
      AppColors.primary;

  static const Color _black =
      Color(0xFF212121);

  static const double _gap = 12;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        final double availableWidth =
            constraints.maxWidth > 0
                ? constraints.maxWidth
                : MediaQuery.sizeOf(
                    context,
                  ).width;

        final double usableWidth =
            availableWidth - 48;

        final double twoTileWidth =
            (usableWidth - _gap) / 2;

        final double tileWidth =
            twoTileWidth
                .clamp(
                  140.0,
                  190.0,
                )
                .toDouble();

        return Container(
          margin:
              const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          padding:
              const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(
              colors: [
                Color(0xFFFFE9E0),
                Color(0xFFFFF3E0),
              ],
              begin:
                  Alignment.topLeft,
              end:
                  Alignment.bottomRight,
            ),
            borderRadius:
                BorderRadius.circular(
              16,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    _accent.withValues(
                  alpha: 0.08,
                ),
                blurRadius: 12,
                offset:
                    const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              // =============================================================
              // HEADER
              // =============================================================

              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration:
                        BoxDecoration(
                      color: _accent,
                      borderRadius:
                          BorderRadius
                              .circular(
                        9,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _accent
                              .withValues(
                            alpha: 0.35,
                          ),
                          blurRadius: 6,
                          offset:
                              const Offset(
                            0,
                            3,
                          ),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons
                          .local_fire_department_rounded,
                      color: AppColors
                          .primaryLight,
                      size: 18,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Text(
                      AppStrings
                          .popularSearch,
                      style:
                          const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                        color: _black,
                        letterSpacing:
                            0.1,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 14,
              ),

              // =============================================================
              // PRODUCT LIST
              // =============================================================

              SizedBox(
                height: 165,
                child:
                    ListView.separated(
                  scrollDirection:
                      Axis.horizontal,
                  physics:
                      const BouncingScrollPhysics(),
                  itemCount:
                      products.length,
                  separatorBuilder:
                      (
                    context,
                    index,
                  ) {
                    return const SizedBox(
                      width: _gap,
                    );
                  },
                  itemBuilder:
                      (
                    context,
                    index,
                  ) {
                    final product =
                        products[index];

                    return SizedBox(
                      width: tileWidth,
                      child:
                          _PopularSearchTile(
                        name: product[
                                    'name']
                                ?.toString() ??
                            '',
                        imageUrl: product[
                                    'imageUrl']
                                ?.toString() ??
                            '',
                        discountLabel:
                            product[
                                    'discountLabel']
                                ?.toString(),
                        onTap: () {
                          onProductTap
                              ?.call(
                            product,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// =============================================================================
// TILE
// =============================================================================

class _PopularSearchTile
    extends StatelessWidget {
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

  static const Color _accent =
      AppColors.primary;

  static const Color _black =
      Color(0xFF212121);

  static const Color _grey =
      Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius:
            BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color:
                AppColors.primaryLight,
            borderRadius:
                BorderRadius.circular(
              14,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withValues(
                  alpha: 0.06,
                ),
                blurRadius: 10,
                offset:
                    const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior:
              Clip.antiAlias,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildImage(),

                    if (discountLabel !=
                            null &&
                        discountLabel!
                            .trim()
                            .isNotEmpty)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration:
                              BoxDecoration(
                            color:
                                _accent,
                            borderRadius:
                                BorderRadius
                                    .circular(
                              5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    _accent
                                        .withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 4,
                                offset:
                                    const Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize
                                    .min,
                            children: [
                              const Icon(
                                Icons
                                    .arrow_downward_rounded,
                                size: 10,
                                color:
                                    AppColors
                                        .primaryLight,
                              ),

                              const SizedBox(
                                width: 1,
                              ),

                              Text(
                                discountLabel!,
                                maxLines: 1,
                                overflow:
                                    TextOverflow
                                        .fade,
                                softWrap:
                                    false,
                                style:
                                    const TextStyle(
                                  color:
                                      AppColors
                                          .primaryLight,
                                  fontSize:
                                      10,
                                  fontWeight:
                                      FontWeight
                                          .w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets
                        .fromLTRB(
                  8,
                  7,
                  8,
                  8,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow:
                          TextOverflow.fade,
                      softWrap: true,
                      style:
                          const TextStyle(
                        fontSize: 12,
                        fontWeight:
                            FontWeight
                                .w500,
                        color: _grey,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(
                      height: 4,
                    ),

                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration:
                          BoxDecoration(
                        color: _accent
                            .withValues(
                          alpha: 0.1,
                        ),
                        borderRadius:
                            BorderRadius
                                .circular(
                          5,
                        ),
                      ),
                      child: FittedBox(
                        fit:
                            BoxFit.scaleDown,
                        alignment:
                            Alignment
                                .centerLeft,
                        child: Text(
                          AppStrings
                              .dealsForYou,
                          maxLines: 1,
                          style:
                              const TextStyle(
                            fontSize:
                                11.5,
                            fontWeight:
                                FontWeight
                                    .w700,
                            color: _black,
                          ),
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

  Widget _buildImage() {
    if (imageUrl.trim().isEmpty) {
      return Container(
        color:
            const Color(0xFFF5F5F5),
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_outlined,
          size: 28,
          color: Colors.grey,
        ),
      );
    }

    final bool isNetwork =
        imageUrl.startsWith(
          'http://',
        ) ||
        imageUrl.startsWith(
          'https://',
        );

    if (isNetwork) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? progress,
        ) {
          if (progress == null) {
            return child;
          }

          return Container(
            color:
                const Color(
              0xFFF5F5F5,
            ),
          );
        },
        errorBuilder: (
          BuildContext context,
          Object error,
          StackTrace? stackTrace,
        ) {
          return Container(
            color:
                const Color(
              0xFFF5F5F5,
            ),
            alignment:
                Alignment.center,
            child: const Icon(
              Icons.image_outlined,
              size: 28,
              color: Colors.grey,
            ),
          );
        },
      );
    }

    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return Container(
          color:
              const Color(
            0xFFF5F5F5,
          ),
          alignment:
              Alignment.center,
          child: const Icon(
            Icons.image_outlined,
            size: 28,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}