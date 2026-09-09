import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  final List<String> searchHints;

  // Search data
  final List<String> categories;
  final List<Map<String, dynamic>> products;

  // Click callbacks
  final ValueChanged<String>? onCategoryTap;
  final ValueChanged<Map<String, dynamic>>? onProductTap;

  const SearchWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
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

  List<String> _filteredCategories = [];
  List<Map<String, dynamic>> _filteredProducts = [];

  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(_controllerListener);
    _focusNode.addListener(_focusListener);

    // যদি external controller-এ আগে থেকেই text থাকে
    if (_controller.text.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _filterSearch(_controller.text);
      });
    }
  }

  // ===========================================================================
  // EXTERNAL CONTROLLER LISTENER
  // ===========================================================================

  void _controllerListener() {
    if (!mounted) return;

    setState(() {});
  }

  // ===========================================================================
  // FOCUS
  // ===========================================================================

  void _focusListener() {
    if (!mounted) return;

    if (_focusNode.hasFocus &&
        _controller.text.trim().isNotEmpty) {
      _filterSearch(_controller.text);
    }
  }

  // ===========================================================================
  // SEARCH FILTER
  // ===========================================================================

  void _filterSearch(String value) {
    final String query = value.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _filteredCategories = [];
        _filteredProducts = [];
        _showSuggestions = false;
      });

      return;
    }

    final List<String> matchedCategories =
        widget.categories.where((category) {
      return category.toLowerCase().contains(query);
    }).toList();

    final List<Map<String, dynamic>> matchedProducts =
        widget.products.where((product) {
      final String name =
          product['name']?.toString().toLowerCase() ?? '';

      return name.contains(query);
    }).toList();

    setState(() {
      _filteredCategories = matchedCategories;
      _filteredProducts = matchedProducts;
      _showSuggestions = true;
    });
  }

  // ===========================================================================
  // SEARCH TEXT CHANGE
  // ===========================================================================

  void _handleSearchChanged(String value) {
    _filterSearch(value);
    widget.onChanged?.call(value);
  }

  // ===========================================================================
  // CLEAR
  // ===========================================================================

  void _clearSearch() {
    _controller.clear();

    setState(() {
      _filteredCategories = [];
      _filteredProducts = [];
      _showSuggestions = false;
    });

    widget.onChanged?.call('');

    _focusNode.requestFocus();
  }

  // ===========================================================================
  // CATEGORY CLICK
  // ===========================================================================

  void _handleCategoryTap(String category) {
    setState(() {
      _showSuggestions = false;
    });

    FocusScope.of(context).unfocus();

    widget.onCategoryTap?.call(category);
  }

  // ===========================================================================
  // PRODUCT CLICK
  // ===========================================================================

  void _handleProductTap(Map<String, dynamic> product) {
    setState(() {
      _showSuggestions = false;
    });

    FocusScope.of(context).unfocus();

    widget.onProductTap?.call(product);
  }

  @override
  void didUpdateWidget(covariant SearchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Parent থেকে category/product data update হলে
    // current query দিয়ে আবার filter করবে।
    if (oldWidget.categories != widget.categories ||
        oldWidget.products != widget.products) {
      if (_controller.text.trim().isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          _filterSearch(_controller.text);
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerListener);
    _focusNode.removeListener(_focusListener);

    _focusNode.dispose();

    if (_ownsController) {
      _controller.dispose();
    }

    super.dispose();
  }

  // ===========================================================================
  // BUILD
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    final bool hasText = _controller.text.trim().isNotEmpty;

    final bool showRotatingHint =
        !hasText && widget.searchHints.isNotEmpty;

    final bool noResult = hasText &&
        _filteredCategories.isEmpty &&
        _filteredProducts.isEmpty;

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
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFFE6E6E6),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(
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

                // Divider
                Container(
                  width: 1,
                  height: 20,
                  color: const Color(0xFFE6E6E6),
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
                // TEXT FIELD + ROTATING HINT
                // =============================================================

                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      if (showRotatingHint)
                        IgnorePointer(
                          child: _VerticalRotatingHint(
                            hints: widget.searchHints,
                          ),
                        ),

                      TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged: _handleSearchChanged,
                        onTap: widget.onTap,
                        textInputAction: TextInputAction.search,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =============================================================
                // CLEAR BUTTON
                // =============================================================

                if (hasText)
                  IconButton(
                    splashRadius: 18,
                    onPressed: _clearSearch,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF9A9A9A),
                      size: 18,
                    ),
                  )
                else
                  const SizedBox(width: 12),
              ],
            ),
          ),

          // ===================================================================
          // SEARCH SUGGESTIONS
          // শুধু কিছু type করলে show হবে
          // ===================================================================

          if (_showSuggestions && hasText) ...[
            const SizedBox(height: 4),

            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxHeight: 430,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
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
                    // =========================================================
                    // CATEGORY SUGGESTIONS
                    // =========================================================

                    if (_filteredCategories.isNotEmpty) ...[
                      const _SuggestionHeader(
                        title: 'CATEGORY SUGGESTIONS',
                      ),

                      ..._filteredCategories.map(
                        (category) {
                          return _CategorySuggestionItem(
                            category: category,
                            onTap: () {
                              _handleCategoryTap(category);
                            },
                          );
                        },
                      ),
                    ],

                    // =========================================================
                    // PRODUCTS
                    // =========================================================

                    if (_filteredProducts.isNotEmpty) ...[
                      const _SuggestionHeader(
                        title: 'PRODUCTS',
                      ),

                      ..._filteredProducts.map(
                        (product) {
                          return _ProductSuggestionItem(
                            product: product,
                            onTap: () {
                              _handleProductTap(product);
                            },
                          );
                        },
                      ),
                    ],

                    // =========================================================
                    // NO RESULT
                    // =========================================================

                    if (noResult)
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 28,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 32,
                              color: Color(0xFFAAAAAA),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'No results found',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF777777),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// =============================================================================
// SUGGESTION HEADER
// =============================================================================

class _SuggestionHeader extends StatelessWidget {
  final String title;

  const _SuggestionHeader({
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
// CATEGORY ITEM
// =============================================================================

class _CategorySuggestionItem extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const _CategorySuggestionItem({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 9,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF202027),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// PRODUCT ITEM
// =============================================================================

class _ProductSuggestionItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _ProductSuggestionItem({
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
        product['imageUrl']?.toString() ?? '';

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              // ===============================================================
              // PRODUCT IMAGE
              // ===============================================================

              Container(
                width: 46,
                height: 52,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: _SearchProductImage(
                  imageUrl: imageUrl,
                ),
              ),

              const SizedBox(width: 14),

              // ===============================================================
              // PRODUCT NAME + PRICE
              // ===============================================================

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF202027),
                      ),
                    ),

                    if (price.isNotEmpty) ...[
                      const SizedBox(height: 4),

                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
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
// Network + Local Asset দুটোই support করবে
// =============================================================================

class _SearchProductImage extends StatelessWidget {
  final String imageUrl;

  const _SearchProductImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const _ImageErrorPlaceholder();
    }

    final bool isNetworkImage =
        imageUrl.startsWith('http://') ||
        imageUrl.startsWith('https://');

    if (isNetworkImage) {
      return Image.network(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        errorBuilder: (
          BuildContext context,
          Object error,
          StackTrace? stackTrace,
        ) {
          return const _ImageErrorPlaceholder();
        },
      );
    }

    return Image.asset(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stackTrace,
      ) {
        return const _ImageErrorPlaceholder();
      },
    );
  }
}

// =============================================================================
// IMAGE ERROR PLACEHOLDER
// =============================================================================

class _ImageErrorPlaceholder extends StatelessWidget {
  const _ImageErrorPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.image_outlined,
        color: Color(0xFFAAAAAA),
        size: 25,
      ),
    );
  }
}

// =============================================================================
// ROTATING SEARCH HINT
// =============================================================================

class _VerticalRotatingHint extends StatefulWidget {
  final List<String> hints;

  const _VerticalRotatingHint({
    required this.hints,
  });

  @override
  State<_VerticalRotatingHint> createState() =>
      _VerticalRotatingHintState();
}

class _VerticalRotatingHintState
    extends State<_VerticalRotatingHint>
    with SingleTickerProviderStateMixin {
  static const double _lineHeight = 18;

  static const TextStyle _hintStyle = TextStyle(
    fontSize: 14,
    color: Color(0xFF9A9A9A),
  );

  late final AnimationController _animationController;

  Timer? _timer;

  int _currentIndex = 0;
  int _nextIndex = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 420,
      ),
    );

    if (widget.hints.length > 1) {
      _nextIndex = 1;

      _timer = Timer.periodic(
        const Duration(seconds: 2),
        (_) {
          _rotate();
        },
      );
    }
  }

  Future<void> _rotate() async {
    if (!mounted ||
        widget.hints.length <= 1 ||
        _animationController.isAnimating) {
      return;
    }

    await _animationController.forward(
      from: 0,
    );

    if (!mounted) return;

    setState(() {
      _currentIndex = _nextIndex;

      _nextIndex =
          (_nextIndex + 1) % widget.hints.length;
    });

    _animationController.value = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();

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
          animation: _animationController,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            final double t =
                _animationController.value;

            return Stack(
              children: [
                Positioned(
                  top: -t * _lineHeight,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 1 - t,
                    child: Text(
                      widget.hints[_currentIndex],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: _hintStyle,
                    ),
                  ),
                ),

                Positioned(
                  top: _lineHeight -
                      (t * _lineHeight),
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: t,
                    child: Text(
                      widget.hints[_nextIndex],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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