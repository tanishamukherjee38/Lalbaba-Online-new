
import 'package:flutter/material.dart';
import '../../../../core/widgets/app_shimmer.dart';

class ProductCardWidget
    extends StatelessWidget {
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

  static const Color accentColor =
      Color(0xFFE23F1C);

  static const Color _ratingGreen =
      Color(0xFF2E7D32);

  static const Color _black =
      Color(0xFF212121);

  static const Color _grey =
      Color(0xFF878787);

  static const Color _imageBg =
      Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    final bool compact = width < 160;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(14),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(14),
            border: Border.all(
              color:
                  const Color(0xFFF0F0F0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withValues(
                  alpha: 0.05,
                ),
                blurRadius: 10,
                offset:
                    const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              // ============================================================
              // PRODUCT IMAGE
              // ============================================================

              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: _imageBg,
                        padding:
                            EdgeInsets.all(
                          compact ? 7 : 10,
                        ),
                        child:
                            _buildProductImage(),
                      ),
                    ),

                    // ======================================================
                    // DISCOUNT BADGE
                    // ======================================================

                    if (discountLabel !=
                            null &&
                        discountLabel!
                            .trim()
                            .isNotEmpty)
                      Positioned(
                        top: 7,
                        left: 7,
                        child: Container(
                          constraints:
                              BoxConstraints(
                            maxWidth:
                                width - 14,
                          ),
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration:
                              BoxDecoration(
                            color:
                                accentColor,
                            borderRadius:
                                BorderRadius
                                    .circular(
                              6,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    accentColor
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
                          child: Text(
                            discountLabel!,
                            maxLines: 1,
                            overflow:
                                TextOverflow
                                    .fade,
                            softWrap: false,
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 10,
                              fontWeight:
                                  FontWeight
                                      .w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // ============================================================
              // PRODUCT INFORMATION
              // ============================================================

              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.fromLTRB(
                    10,
                    7,
                    10,
                    4,
                  ),
                  child: showPriceAndRating
                      ? _buildFullInfo(
                          compact,
                        )
                      : _buildSimpleInfo(
                          compact,
                        ),
                ),
              ),

              // ============================================================
              // ADD TO CART BUTTON
              // ============================================================

              if (onAddToCart != null)
                SizedBox(
                  height: 39,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets
                            .fromLTRB(
                      8,
                      1,
                      8,
                      7,
                    ),
                    child: SizedBox(
                      width:
                          double.infinity,
                      height: 31,
                      child:
                          ElevatedButton(
                        onPressed:
                            onAddToCart,
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              accentColor,
                          foregroundColor:
                              Colors.white,
                          elevation: 0,

                          // Important:
                          // default minimum
                          // button width remove.
                          minimumSize:
                              Size.zero,

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 4,
                            vertical: 0,
                          ),

                          tapTargetSize:
                              MaterialTapTargetSize
                                  .shrinkWrap,

                          visualDensity:
                              VisualDensity
                                  .compact,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              8,
                            ),
                          ),
                        ),
                        child:
                            const FittedBox(
                          fit:
                              BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize:
                                MainAxisSize
                                    .min,
                            children: [
                              Icon(
                                Icons
                                    .add_shopping_cart_rounded,
                                size: 14,
                              ),
                              SizedBox(
                                  width: 5),
                              Text(
                                'Add to Cart',
                                maxLines: 1,
                                softWrap:
                                    false,
                                style:
                                    TextStyle(
                                  fontSize:
                                      11,
                                  fontWeight:
                                      FontWeight
                                          .w700,
                                  letterSpacing:
                                      0.1,
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

  // ==========================================================================
  // FULL INFO
  // ==========================================================================

  Widget _buildFullInfo(
    bool compact,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        // ================================================================
        // PRODUCT NAME
        // ================================================================

        Flexible(
          child: Text(
            name,

            // maxLines + ellipsis remove.
            // Text available space-er moddhe
            // naturally wrap korbe.
            softWrap: true,

            overflow:
                TextOverflow.fade,

            style: TextStyle(
              fontSize:
                  compact ? 11.8 : 12.5,
              fontWeight:
                  FontWeight.w600,
              color: _black,
              height: 1.22,
            ),
          ),
        ),

        const SizedBox(height: 5),

        // ================================================================
        // RATING
        // ================================================================

        if (rating > 0)
          Container(
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

        if (rating > 0)
          const SizedBox(height: 5),

        // ================================================================
        // PRICE
        // ================================================================

        if (price.isNotEmpty ||
            (originalPrice != null &&
                originalPrice!
                    .isNotEmpty))
          Wrap(
            spacing: 6,
            runSpacing: 2,
            crossAxisAlignment:
                WrapCrossAlignment.center,
            children: [
              if (price.isNotEmpty)
                Text(
                  price,
                  style:
                      const TextStyle(
                    fontSize: 14.5,
                    fontWeight:
                        FontWeight.w800,
                    color: _black,
                  ),
                ),

              if (originalPrice !=
                      null &&
                  originalPrice!
                      .isNotEmpty)
                Text(
                  originalPrice!,
                  style:
                      const TextStyle(
                    fontSize: 11,
                    color: _grey,
                    decoration:
                        TextDecoration
                            .lineThrough,
                    decorationColor:
                        _grey,
                  ),
                ),
            ],
          ),
      ],
    );
  }

  // ==========================================================================
  // SIMPLE INFO
  // ==========================================================================

  Widget _buildSimpleInfo(
    bool compact,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        name,
        textAlign: TextAlign.center,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontSize:
              compact ? 11.5 : 12,
          fontWeight:
              FontWeight.w600,
          color: _black,
          height: 1.25,
        ),
      ),
    );
  }

  // ==========================================================================
  // PRODUCT IMAGE
  // ==========================================================================

  Widget _buildProductImage() {
    if (imageUrl.trim().isEmpty) {
      return const Center(
        child: Icon(
          Icons.image_outlined,
          size: 32,
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
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent?
              loadingProgress,
        ) {
          if (loadingProgress ==
              null) {
            return child;
          }

          return AppShimmer(
            width: double.infinity,
            height: imageHeight,
            radius: 10,
          );
        },
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
      );
    }

    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
      width: double.infinity,
      height: double.infinity,
      frameBuilder: (
        context,
        child,
        frame,
        wasSynchronouslyLoaded,
      ) {
        if (wasSynchronouslyLoaded) {
          return child;
        }

        if (frame == null) {
          return AppShimmer(
            width: double.infinity,
            height: imageHeight,
            radius: 10,
          );
        }

        return child;
      },
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const Center(
          child: Icon(
            Icons.image_outlined,
            size: 32,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}