


import 'package:flutter/material.dart';
import '../../../../core/widgets/app_shimmer.dart';

// ==============================================================================
// PRODUCT IMAGE HEADER
// ==============================================================================

class ProductImageHeader
    extends StatefulWidget {
  final String imageUrl;
  final String name;

  const ProductImageHeader({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  State<ProductImageHeader>
      createState() =>
          _ProductImageHeaderState();
}

class _ProductImageHeaderState
    extends State<ProductImageHeader> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth =
            constraints.maxWidth;

        double imageHeight;

        if (cardWidth < 160) {
          imageHeight = 140;
        } else if (cardWidth < 220) {
          imageHeight = 158;
        } else {
          imageHeight = 175;
        }

        return Column(
          children: [
            // ============================================
            // IMAGE
            // ============================================

            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (
                        context,
                        child,
                        loadingProgress,
                      ) {
                        if (loadingProgress ==
                            null) {
                          return child;
                        }

                        return AppShimmer(
                          width:
                              double.infinity,
                          height:
                              imageHeight,
                          radius: 0,
                        );
                      },
                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return const Center(
                          child: Icon(
                            Icons
                                .broken_image,
                            color:
                                Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  // ========================================
                  // FAVOURITE
                  // ========================================

                  Positioned(
                    top: 7,
                    right: 7,
                    child:
                        GestureDetector(
                      onTap: () {
                        setState(() {
                          favourite =
                              !favourite;
                        });
                      },
                      child: Icon(
                        favourite
                            ? Icons.favorite
                            : Icons
                                .favorite_border,
                        color: favourite
                            ? const Color(
                                0xFFE23F1C,
                              )
                            : Colors.grey,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ============================================
            // PRODUCT NAME
            // ============================================

            SizedBox(
              height: 34,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 7,
                ),
                child: Align(
                  alignment:
                      Alignment.centerLeft,
                  child: Text(
                    widget.name,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        const TextStyle(
                      fontSize: 13,
                      height: 1.15,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}