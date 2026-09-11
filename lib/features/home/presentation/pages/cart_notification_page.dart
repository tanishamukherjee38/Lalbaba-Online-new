import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/services/cart_notification_item.dart';
import '../../../../core/services/cart_service.dart';
import '../../../../core/widgets/app_app_bar.dart';

class CartNotificationPage
    extends StatelessWidget {
  const CartNotificationPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor:
          const Color(
        0xFFFAFAFA,
      ),

      appBar: AppAppBar(
        title: 'Added to Cart',
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body: ValueListenableBuilder<
          List<CartNotificationItem>>(
        valueListenable:
            CartService.items,

        builder: (
          context,
          items,
          child,
        ) {
          if (items.isEmpty) {
            return const
                _EmptyCartNotification();
          }

          return Column(
            children: [
              // =============================================================
              // SUMMARY
              // =============================================================

              _SummaryHeader(
                itemCount:
                    items.length,
              ),

              // =============================================================
              // ADDED PRODUCTS
              // =============================================================

              Expanded(
                child:
                    ListView.separated(
                  padding:
                      const EdgeInsets
                          .fromLTRB(
                    12,
                    10,
                    12,
                    24,
                  ),

                  itemCount:
                      items.length,

                  separatorBuilder:
                      (
                    context,
                    index,
                  ) {
                    return const SizedBox(
                      height: 10,
                    );
                  },

                  itemBuilder:
                      (
                    context,
                    index,
                  ) {
                    final CartNotificationItem
                        item =
                        items[index];

                    return _AddedProductCard(
                      item: item,

                      onRemove:
                          () async {
                        await CartService
                            .removeItem(
                          item,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// =============================================================================
// SUMMARY HEADER
// =============================================================================

class _SummaryHeader
    extends StatelessWidget {
  final int itemCount;

  const _SummaryHeader({
    required this.itemCount,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.fromLTRB(
        16,
        12,
        10,
        12,
      ),

      decoration:
          const BoxDecoration(
        color: Colors.white,

        border: Border(
          bottom: BorderSide(
            color:
                Color(
              0xFFEEEEEE,
            ),
          ),
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child:
                ValueListenableBuilder<
                    int>(
              valueListenable:
                  CartService.count,

              builder: (
                context,
                count,
                child,
              ) {
                return Text(
                  '$itemCount products • $count total quantity',

                  style:
                      const TextStyle(
                    fontSize: 14,
                    fontWeight:
                        FontWeight.w600,
                    color:
                        Color(
                      0xFF212121,
                    ),
                  ),
                );
              },
            ),
          ),

          TextButton(
            onPressed: () {
              _showClearDialog(
                context,
              );
            },

            child: const Text(
              'Clear All',

              style: TextStyle(
                color:
                    AppColors.primary,
                fontWeight:
                    FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showClearDialog(
    BuildContext context,
  ) async {
    final bool clear =
        await showDialog<bool>(
              context: context,

              builder:
                  (context) {
                return AlertDialog(
                  title:
                      const Text(
                    'Clear added products?',
                  ),

                  content:
                      const Text(
                    'All products shown in this list will be removed and the notification count will become 0.',
                  ),

                  actions: [
                    TextButton(
                      onPressed:
                          () {
                        Navigator.pop(
                          context,
                          false,
                        );
                      },

                      child:
                          const Text(
                        'Cancel',
                      ),
                    ),

                    TextButton(
                      onPressed:
                          () {
                        Navigator.pop(
                          context,
                          true,
                        );
                      },

                      child:
                          const Text(
                        'Clear',

                        style:
                            TextStyle(
                          color:
                              AppColors
                                  .primary,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ) ??
            false;

    if (clear) {
      await CartService
          .clearCart();
    }
  }
}

// =============================================================================
// PRODUCT CARD
// =============================================================================

class _AddedProductCard
    extends StatelessWidget {
  final CartNotificationItem item;

  final VoidCallback onRemove;

  const _AddedProductCard({
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding:
          const EdgeInsets.all(
        10,
      ),

      decoration: BoxDecoration(
        color:
            Colors.white,

        borderRadius:
            BorderRadius.circular(
          12,
        ),

        border: Border.all(
          color:
              const Color(
            0xFFEEEEEE,
          ),
        ),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black
                    .withValues(
              alpha: 0.04,
            ),

            blurRadius: 8,

            offset:
                const Offset(
              0,
              3,
            ),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          // ===============================================================
          // IMAGE
          // ===============================================================

          _ProductImage(
            imageUrl:
                item.imageUrl,
          ),

          const SizedBox(
            width: 12,
          ),

          // ===============================================================
          // INFO
          // ===============================================================

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                Text(
                  item.name,

                  maxLines: 2,

                  overflow:
                      TextOverflow
                          .ellipsis,

                  style:
                      const TextStyle(
                    fontSize: 14,

                    fontWeight:
                        FontWeight
                            .w700,

                    color:
                        Color(
                      0xFF212121,
                    ),

                    height: 1.25,
                  ),
                ),

                // =========================================================
                // WEIGHT
                // =========================================================

                if (item.weight !=
                    null) ...[
                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    'Weight: ${item.weight}',

                    style:
                        const TextStyle(
                      fontSize: 12,

                      color:
                          Color(
                        0xFF666666,
                      ),
                    ),
                  ),
                ],

                const SizedBox(
                  height: 7,
                ),

                // =========================================================
                // PRICE
                // =========================================================

                Wrap(
                  spacing: 7,
                  runSpacing: 4,

                  crossAxisAlignment:
                      WrapCrossAlignment
                          .center,

                  children: [
                    if (item.price
                        .isNotEmpty)
                      Text(
                        item.price,

                        style:
                            const TextStyle(
                          fontSize:
                              15,

                          fontWeight:
                              FontWeight
                                  .w800,

                          color:
                              Color(
                            0xFF212121,
                          ),
                        ),
                      ),

                    if (item
                            .originalPrice !=
                        null)
                      Text(
                        item.originalPrice!,

                        style:
                            const TextStyle(
                          fontSize:
                              12,

                          color:
                              Color(
                            0xFF888888,
                          ),

                          decoration:
                              TextDecoration
                                  .lineThrough,
                        ),
                      ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                // =========================================================
                // QUANTITY
                // =========================================================

                Container(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        AppColors.primary
                            .withValues(
                      alpha: 0.10,
                    ),

                    borderRadius:
                        BorderRadius
                            .circular(
                      20,
                    ),
                  ),

                  child: Text(
                    'Quantity: ${item.quantity}',

                    style:
                        const TextStyle(
                      fontSize: 12,

                      fontWeight:
                          FontWeight
                              .w700,

                      color:
                          AppColors
                              .primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===============================================================
          // REMOVE
          // ===============================================================

          IconButton(
            tooltip: 'Remove',

            onPressed:
                onRemove,

            icon: const Icon(
              Icons.close_rounded,

              size: 20,

              color:
                  Color(
                0xFF777777,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// PRODUCT IMAGE
// =============================================================================

class _ProductImage
    extends StatelessWidget {
  final String imageUrl;

  const _ProductImage({
    required this.imageUrl,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 82,
      height: 82,

      padding:
          const EdgeInsets.all(
        6,
      ),

      decoration: BoxDecoration(
        color:
            const Color(
          0xFFFAFAFA,
        ),

        borderRadius:
            BorderRadius.circular(
          10,
        ),
      ),

      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(
          8,
        ),

        child:
            _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl
        .trim()
        .isEmpty) {
      return const Icon(
        Icons.image_outlined,
        color: Colors.grey,
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

        errorBuilder: (
          context,
          error,
          stackTrace,
        ) {
          return const Icon(
            Icons.image_outlined,
            color: Colors.grey,
          );
        },
      );
    }

    return Image.asset(
      imageUrl,

      fit: BoxFit.contain,

      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const Icon(
          Icons.image_outlined,
          color: Colors.grey,
        );
      },
    );
  }
}

// =============================================================================
// EMPTY
// =============================================================================

class _EmptyCartNotification
    extends StatelessWidget {
  const _EmptyCartNotification();

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Center(
      child: Padding(
        padding:
            EdgeInsets.all(
          24,
        ),

        child: Column(
          mainAxisSize:
              MainAxisSize.min,

          children: [
            Icon(
              Icons
                  .notifications_none_rounded,

              size: 72,

              color:
                  Colors.grey,
            ),

            SizedBox(
              height: 16,
            ),

            Text(
              'No added products yet',

              textAlign:
                  TextAlign.center,

              style:
                  TextStyle(
                fontSize: 18,

                fontWeight:
                    FontWeight
                        .w700,

                color:
                    Color(
                  0xFF212121,
                ),
              ),
            ),

            SizedBox(
              height: 6,
            ),

            Text(
              'Add a product from any page. It will appear here automatically.',

              textAlign:
                  TextAlign.center,

              style:
                  TextStyle(
                fontSize: 13,

                color:
                    Color(
                  0xFF777777,
                ),

                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}