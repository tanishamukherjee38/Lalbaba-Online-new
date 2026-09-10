



import 'dart:async';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  final ValueChanged<int>? onBannerTap;

  const BannerWidget({
    super.key,
    this.onBannerTap,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  static const Color _primary = Color(0xFFF70707);
  static const Color _black = Color(0xFF000000);
  static const Color _grey = Color(0xFF9E9E9E);

  // ===========================================================================
  // BANNER IMAGE URLS
  // ===========================================================================

  static const List<String> _bannerImageUrls = [
    'https://lalbabaonline.com/public/uploads/all/XuxYGkH5U1dpGFcK5x3SBtphEhgDg2hka78lG3vS.webp',
    'https://lalbabaonline.com/public/uploads/all/ih7h1OcLwu13H3TVKBdIOyNVgIp4pP3PoQa9coxj.webp',
    'https://lalbabaonline.com/public/uploads/all/96hqz7NNM37PLDfGpg3fNEm4joTpvgftraurkNVR.webp',
    'https://lalbabaonline.com/public/uploads/all/EryH9j4ylQ7qtbZM5iyUuUvTvn6gUwoy7WOluwe9.webp',
  ];

  late final PageController _pageController;
  Timer? _autoScrollTimer;

  late final int _initialPage;

  int _currentIndex = 0;

  int get _bannerCount => _bannerImageUrls.length;

  // ===========================================================================
  // INIT STATE
  // ===========================================================================

  @override
  void initState() {
    super.initState();

    _initialPage = _bannerCount > 0
        ? 10000 - (10000 % _bannerCount)
        : 0;

    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 0.92,
    );

    if (_bannerCount > 1) {
      _autoScrollTimer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _goToNext(),
      );
    }
  }

  // ===========================================================================
  // AUTO NEXT
  // ===========================================================================

  void _goToNext() {
    if (!_pageController.hasClients || _bannerCount <= 1) {
      return;
    }

    final int currentPage =
        _pageController.page?.round() ?? _initialPage;

    _pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }

  // ===========================================================================
  // DISPOSE
  // ===========================================================================

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // ===========================================================================
  // BUILD
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    if (_bannerCount == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // =====================================================================
        // BANNER
        // =====================================================================

        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,

            // Large itemCount for infinite scroll effect.
            itemCount: 100000,

            onPageChanged: (pageIndex) {
              final int actualIndex =
                  pageIndex % _bannerCount;

              if (!mounted) return;

              setState(() {
                _currentIndex = actualIndex;
              });
            },

            itemBuilder: (context, pageIndex) {
              final int imageIndex =
                  pageIndex % _bannerCount;

              final String imageUrl =
                  _bannerImageUrls[imageIndex];

              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;

                  if (_pageController.hasClients &&
                      _pageController
                          .position
                          .haveDimensions) {
                    final double page =
                        _pageController.page ??
                            _initialPage.toDouble();

                    scale =
                        (1 -
                                ((page - pageIndex).abs() *
                                    0.06))
                            .clamp(
                              0.94,
                              1.0,
                            );
                  }

                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      widget.onBannerTap?.call(
                        imageIndex,
                      );
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: _black.withValues(
                                alpha: 0.08,
                              ),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: _BannerImage(
                          imageUrl: imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // =====================================================================
        // DOT INDICATOR
        // =====================================================================

        if (_bannerCount > 1) ...[
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _bannerCount,
              (index) {
                final bool isActive =
                    index == _currentIndex;

                return AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 220),
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  width: isActive ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isActive
                        ? _primary
                        : _grey.withValues(
                            alpha: 0.4,
                          ),
                    borderRadius:
                        BorderRadius.circular(3),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

// =============================================================================
// BANNER IMAGE
// =============================================================================

class _BannerImage extends StatelessWidget {
  final String imageUrl;

  const _BannerImage({
    required this.imageUrl,
  });

  static const Color _secondary =
      Color(0xFFEEE4E4);

  static const Color _primary =
      Color(0xFFF70707);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,

      // =======================================================================
      // IMAGE LOADING
      //
      // এখানে আগে CircularProgressIndicator ছিল।
      // সেটা remove করা হয়েছে।
      // Image load হওয়ার সময় শুধু placeholder background থাকবে।
      // =======================================================================

      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          color: _secondary,
        );
      },

      // =======================================================================
      // IMAGE ERROR
      // =======================================================================

      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stackTrace,
      ) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: _secondary,
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: _primary,
            size: 26,
          ),
        );
      },
    );
  }
}

