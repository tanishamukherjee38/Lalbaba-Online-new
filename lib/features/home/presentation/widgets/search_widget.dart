

import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/widgets/app_shimmer.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  final List<String> searchHints;

  // Search suggestion data
  final List<String> categories;
  final List<Map<String, dynamic>> products;

  final ValueChanged<String>? onCategoryTap;
  final ValueChanged<Map<String, dynamic>>? onProductTap;

  const SearchWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.searchHints = const [
      'Search for Rice',
      'Search for Spices',
    ],
    this.categories = const [],
    this.products = const [],
    this.onCategoryTap,
    this.onProductTap,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController _controller;
  late final bool _ownsController;

  final FocusNode _focusNode = FocusNode();

  Timer? _searchTimer;

  bool _showResult = false;
  bool _isSearching = false;

  List<String> _filteredCategories = [];
  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;

    _controller =
        widget.controller ?? TextEditingController();

    _controller.addListener(_onControllerChanged);
  }

  // ===========================================================================
  // CONTROLLER
  // ===========================================================================

  void _onControllerChanged() {
    if (!mounted) return;

    setState(() {});
  }

  // ===========================================================================
  // SEARCH
  // ===========================================================================

  void _onSearchChanged(String value) {
    widget.onChanged?.call(value);

    _searchTimer?.cancel();

    final String query =
        value.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _showResult = false;
        _isSearching = false;

        _filteredCategories = [];
        _filteredProducts = [];
      });

      return;
    }

    // Type করার সাথে সাথে shimmer show
    setState(() {
      _showResult = true;
      _isSearching = true;
    });

    // পরে API এলে এখানে API search বসাতে পারো
    _searchTimer = Timer(
      const Duration(milliseconds: 450),
      () {
        if (!mounted) return;

        // =============================================================
        // CATEGORY FILTER
        // =============================================================

        final List<String> categories =
            widget.categories.where(
          (category) {
            return category
                .toLowerCase()
                .contains(query);
          },
        ).toList();

        // =============================================================
        // PRODUCT FILTER
        // =============================================================

        final List<Map<String, dynamic>> products =
            widget.products.where(
          (product) {
            final String name =
                product['name']
                        ?.toString()
                        .toLowerCase() ??
                    '';

            return name.contains(query);
          },
        ).toList();

        setState(() {
          _filteredCategories = categories;
          _filteredProducts = products;

          _isSearching = false;
        });
      },
    );
  }

  // ===========================================================================
  // CLEAR
  // ===========================================================================

  void _clearSearch() {
    _searchTimer?.cancel();

    _controller.clear();

    setState(() {
      _showResult = false;
      _isSearching = false;

      _filteredCategories = [];
      _filteredProducts = [];
    });

    widget.onChanged?.call('');

    _focusNode.requestFocus();
  }

  // ===========================================================================
  // CATEGORY TAP
  // ===========================================================================

  void _handleCategoryTap(
    String category,
  ) {
    FocusScope.of(context).unfocus();

    setState(() {
      _showResult = false;
    });

    widget.onCategoryTap?.call(category);
  }

  // ===========================================================================
  // PRODUCT TAP
  // ===========================================================================

  void _handleProductTap(
    Map<String, dynamic> product,
  ) {
    FocusScope.of(context).unfocus();

    setState(() {
      _showResult = false;
    });

    widget.onProductTap?.call(product);
  }

  @override
  void dispose() {
    _searchTimer?.cancel();

    _controller.removeListener(
      _onControllerChanged,
    );

    _focusNode.dispose();

    if (_ownsController) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasText =
        _controller.text.trim().isNotEmpty;

    final bool showRotatingHint =
        !hasText &&
        widget.searchHints.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ===================================================================
          // SEARCH BAR
          // ===================================================================

          Container(
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius:
                  BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFFE6E6E6),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      AppColors.black.withValues(
                    alpha: 0.05,
                  ),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),

                // =============================================================
                // LOGO
                // =============================================================

                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    AssetConstants.logo,
                    fit: BoxFit.contain,
                    frameBuilder: (
                      BuildContext context,
                      Widget child,
                      int? frame,
                      bool wasSynchronouslyLoaded,
                    ) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }

                      if (frame == null) {
                        return const AppShimmer(
                          width: 24,
                          height: 24,
                          radius: 6,
                        );
                      }

                      return child;
                    },
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return const Icon(
                        Icons.rice_bowl_rounded,
                        color: AppColors.error,
                        size: 20,
                      );
                    },
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  width: 1,
                  height: 20,
                  color:
                      const Color(0xFFE6E6E6),
                ),

                const SizedBox(width: 8),

                // =============================================================
                // SEARCH ICON
                // =============================================================

                const Icon(
                  Icons.search_rounded,
                  color: Color(0xFF9A9A9A),
                  size: 22,
                ),

                const SizedBox(width: 6),

                // =============================================================
                // TEXT FIELD
                // =============================================================

                Expanded(
                  child: Stack(
                    alignment:
                        Alignment.centerLeft,
                    children: [
                      if (showRotatingHint)
                        IgnorePointer(
                          child:
                              _VerticalRotatingHint(
                            hints:
                                widget.searchHints,
                          ),
                        ),

                      TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged:
                            _onSearchChanged,
                        textInputAction:
                            TextInputAction.search,
                        style:
                            const TextStyle(
                          fontSize: 14,
                          color:
                              AppColors.black,
                        ),
                        decoration:
                            const InputDecoration(
                          border:
                              InputBorder.none,
                          enabledBorder:
                              InputBorder.none,
                          focusedBorder:
                              InputBorder.none,
                          isDense: true,
                          contentPadding:
                              EdgeInsets
                                  .symmetric(
                            vertical: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =============================================================
                // CLEAR
                // =============================================================

                if (hasText)
                  IconButton(
                    splashRadius: 18,
                    onPressed: _clearSearch,
                    icon: const Icon(
                      Icons.close_rounded,
                      color:
                          Color(0xFF9A9A9A),
                      size: 18,
                    ),
                  )
                else
                  const SizedBox(width: 12),
              ],
            ),
          ),

          // ===================================================================
          // SEARCH RESULT
          // ===================================================================

          if (_showResult && hasText) ...[
            const SizedBox(height: 5),

            if (_isSearching)
              const _SearchResultShimmer()
            else
              _SearchResultBox(
                categories:
                    _filteredCategories,
                products:
                    _filteredProducts,
                onCategoryTap:
                    _handleCategoryTap,
                onProductTap:
                    _handleProductTap,
              ),
          ],
        ],
      ),
    );
  }
}

// =============================================================================
// SEARCH RESULT BOX
// =============================================================================

class _SearchResultBox extends StatelessWidget {
  final List<String> categories;
  final List<Map<String, dynamic>> products;

  final ValueChanged<String> onCategoryTap;
  final ValueChanged<Map<String, dynamic>>
      onProductTap;

  const _SearchResultBox({
    required this.categories,
    required this.products,
    required this.onCategoryTap,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool noResult =
        categories.isEmpty &&
        products.isEmpty;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 430,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.08,
            ),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ===============================================================
            // CATEGORY SUGGESTIONS
            // ===============================================================

            if (categories.isNotEmpty) ...[
              const _SearchHeader(
                title:
                    'CATEGORY SUGGESTIONS',
              ),

              ...categories.map(
                (category) {
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        onCategoryTap(
                          category,
                        );
                      },
                      child: Container(
                        width:
                            double.infinity,
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 18,
                          vertical: 9,
                        ),
                        child: Text(
                          category,
                          style:
                              const TextStyle(
                            fontSize: 13,
                            fontWeight:
                                FontWeight.w600,
                            color:
                                Color(
                              0xFF202027,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],

            // ===============================================================
            // PRODUCTS
            // ===============================================================

            if (products.isNotEmpty) ...[
              const _SearchHeader(
                title: 'PRODUCTS',
              ),

              ...products.map(
                (product) {
                  return _SearchProductItem(
                    product: product,
                    onTap: () {
                      onProductTap(
                        product,
                      );
                    },
                  );
                },
              ),
            ],

            // ===============================================================
            // NO RESULT
            // ===============================================================

            if (noResult)
              const Padding(
                padding:
                    EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 34,
                      color:
                          Color(0xFFAAAAAA),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            Color(
                          0xFF777777,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// HEADER
// =============================================================================

class _SearchHeader extends StatelessWidget {
  final String title;

  const _SearchHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF1F2F4),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          color: Color(0xFF747A84),
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

// =============================================================================
// PRODUCT ITEM
// =============================================================================

class _SearchProductItem
    extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _SearchProductItem({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String name =
        product['name']?.toString() ?? '';

    final String price =
        product['price']?.toString() ?? '';

    final String imageUrl =
        product['imageUrl']?.toString() ??
            '';

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 52,
                padding:
                    const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF7F7F7,
                  ),
                  borderRadius:
                      BorderRadius.circular(
                    5,
                  ),
                ),
                child: _SearchProductImage(
                  imageUrl: imageUrl,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow:
                          TextOverflow
                              .ellipsis,
                      style:
                          const TextStyle(
                        fontSize: 13.5,
                        height: 1.25,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            Color(
                          0xFF202027,
                        ),
                      ),
                    ),

                    if (price.isNotEmpty) ...[
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        price,
                        style:
                            const TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight
                                  .w800,
                          color:
                              Colors.black,
                        ),
                      ),
                    ],
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

// =============================================================================
// PRODUCT IMAGE
// =============================================================================

class _SearchProductImage
    extends StatelessWidget {
  final String imageUrl;

  const _SearchProductImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const _ImagePlaceholder();
    }

    final bool isNetwork =
        imageUrl.startsWith('http://') ||
        imageUrl.startsWith('https://');

    if (isNetwork) {
      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? progress,
        ) {
          if (progress == null) {
            return child;
          }

          return const AppShimmer(
            width: 46,
            height: 52,
            radius: 5,
          );
        },
        errorBuilder: (
          context,
          error,
          stackTrace,
        ) {
          return const _ImagePlaceholder();
        },
      );
    }

    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
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
          return const AppShimmer(
            width: 46,
            height: 52,
            radius: 5,
          );
        }

        return child;
      },
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const _ImagePlaceholder();
      },
    );
  }
}

class _ImagePlaceholder
    extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.image_outlined,
        size: 24,
        color: Color(0xFFAAAAAA),
      ),
    );
  }
}

// =============================================================================
// SEARCH SHIMMER
// =============================================================================

class _SearchResultShimmer
    extends StatelessWidget {
  const _SearchResultShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
        ),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: AppShimmer(
              width: 135,
              height: 12,
              radius: 4,
            ),
          ),

          SizedBox(height: 12),

          AppShimmer(
            width: 90,
            height: 14,
            radius: 4,
          ),

          SizedBox(height: 10),

          AppShimmer(
            width: 120,
            height: 14,
            radius: 4,
          ),

          SizedBox(height: 15),

          Align(
            alignment: Alignment.centerRight,
            child: AppShimmer(
              width: 70,
              height: 12,
              radius: 4,
            ),
          ),

          SizedBox(height: 12),

          _ProductResultShimmer(),

          SizedBox(height: 10),

          _ProductResultShimmer(),
        ],
      ),
    );
  }
}

class _ProductResultShimmer
    extends StatelessWidget {
  const _ProductResultShimmer();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AppShimmer(
          width: 46,
          height: 52,
          radius: 5,
        ),

        SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              AppShimmer(
                height: 13,
                radius: 4,
              ),
              SizedBox(height: 8),
              AppShimmer(
                width: 75,
                height: 13,
                radius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// ROTATING HINT
// =============================================================================

class _VerticalRotatingHint
    extends StatefulWidget {
  final List<String> hints;

  const _VerticalRotatingHint({
    required this.hints,
  });

  @override
  State<_VerticalRotatingHint>
      createState() =>
          _VerticalRotatingHintState();
}

class _VerticalRotatingHintState
    extends State<_VerticalRotatingHint>
    with SingleTickerProviderStateMixin {
  static const double _lineHeight = 18;

  static const TextStyle _hintStyle =
      TextStyle(
    fontSize: 14,
    color: Color(0xFF9A9A9A),
  );

  late final AnimationController
      _controller;

  Timer? _timer;

  int _currentIndex = 0;
  int _nextIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 420),
    );

    if (widget.hints.length > 1) {
      _nextIndex = 1;

      _timer = Timer.periodic(
        const Duration(seconds: 2),
        (_) => _rotate(),
      );
    }
  }

  Future<void> _rotate() async {
    if (!mounted ||
        widget.hints.length <= 1 ||
        _controller.isAnimating) {
      return;
    }

    await _controller.forward(from: 0);

    if (!mounted) return;

    setState(() {
      _currentIndex = _nextIndex;

      _nextIndex =
          (_nextIndex + 1) %
          widget.hints.length;
    });

    _controller.value = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hints.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.hints.length == 1) {
      return Text(
        widget.hints.first,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _hintStyle,
      );
    }

    return ClipRect(
      child: SizedBox(
        height: _lineHeight,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (
            context,
            child,
          ) {
            final double t =
                _controller.value;

            return Stack(
              children: [
                Positioned(
                  top: -t * _lineHeight,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 1 - t,
                    child: Text(
                      widget.hints[
                          _currentIndex],
                      maxLines: 1,
                      overflow:
                          TextOverflow
                              .ellipsis,
                      style: _hintStyle,
                    ),
                  ),
                ),

                Positioned(
                  top: _lineHeight -
                      t * _lineHeight,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: t,
                    child: Text(
                      widget.hints[
                          _nextIndex],
                      maxLines: 1,
                      overflow:
                          TextOverflow
                              .ellipsis,
                      style: _hintStyle,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}