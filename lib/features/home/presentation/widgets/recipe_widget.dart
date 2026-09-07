import 'dart:async';

import 'package:flutter/material.dart';

class RecipeWidget extends StatefulWidget {
  final ValueChanged<int>? onRecipeTap;

  const RecipeWidget({
    super.key,
    this.onRecipeTap,
  });

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  static const Color _primary = Color(0xFFF70707);
  static const Color _secondary = Color(0xFFEEE4E4);
  static const Color _black = Color(0xFF000000);

  // ─────────────────────────────────────────────
  // RECIPE ITEMS — image + title, set here so the
  // home page only needs to drop in `RecipeWidget()`.
  // Titles are placeholders matched to the images you
  // shared — rename them to the actual recipe names
  // whenever you're ready; layout won't need to change.
  // ─────────────────────────────────────────────
  static const List<Map<String, String>> _recipes = [
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/y4NE0in0SBidT7FjYc9OkOWMDt9PelZi9U4wEHA6.webp',
      'title': 'Basmati Mixed Fried Rice (Indo-Chinese Style)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/tyyWmiCV2vMtiFKPeYq43STzLh6LhjGAuPakXxGo.webp',
      'title': 'Vegetable Pulao (Light & Fragrant)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/00D3pqgepFevSrA9fvG42scBArhC8QkSU41HmDQJ.webp',
      'title': 'Classic Chicken Biryani',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/SuNZxBfg7s4Mx4XxK6N4wqcG9qCrOYxDmuPdm6td.webp',
      'title': 'Lemon Rice (South Indian Style)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/dS7re1Qz0FvnooB5aLCN1HumVF5qwmOcaHnnuN10.webp',
      'title': 'Coconut Rice (Kerala Style)',
    },
  ];

  late final PageController _pageController;
  Timer? _autoScrollTimer;
  late final int _initialPage;

  int get _recipeCount => _recipes.length;

  @override
  void initState() {
    super.initState();

    _initialPage = _recipeCount > 0 ? 10000 - (10000 % _recipeCount) : 0;

    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 0.74,
    );

    if (_recipeCount > 1) {
      _autoScrollTimer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _goToNext(),
      );
    }
  }

  void _goToNext() {
    if (!_pageController.hasClients || _recipeCount <= 1) return;

    final int currentPage = _pageController.page?.round() ?? _initialPage;

    // Always move forward by one virtual page — same trick as the
    // banner — so looping from the last recipe back to the first
    // never looks like it's rewinding.
    _pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_recipeCount == 0) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recipes You\'ll Love',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: _black,
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            // Very large item count gives the infinite-scroll effect.
            itemCount: 100000,
            itemBuilder: (context, pageIndex) {
              final int index = pageIndex % _recipeCount;
              final recipe = _recipes[index];

              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_pageController.hasClients &&
                      _pageController.position.haveDimensions) {
                    final double page =
                        _pageController.page ?? _initialPage.toDouble();
                    scale = (1 - ((page - pageIndex).abs() * 0.08)).clamp(
                      0.92,
                      1.0,
                    );
                  }
                  return Transform.scale(scale: scale, child: child);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () => widget.onRecipeTap?.call(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: _black.withOpacity(0.10),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // ── IMAGE ──
                            _RecipeImage(imageUrl: recipe['imageUrl']!),

                            // ── GRADIENT (keeps text readable
                            // without darkening the whole photo) ──
                            const Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Color(0xB3000000),
                                    ],
                                    stops: [0.45, 1.0],
                                  ),
                                ),
                              ),
                            ),

                            // ── TITLE ──
                            Positioned(
                              left: 14,
                              right: 14,
                              bottom: 14,
                              child: Text(
                                recipe['title']!.toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w800,
                                  height: 1.25,
                                  letterSpacing: 0.1,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black54,
                                      blurRadius: 6,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Handles the states of a single recipe image cleanly: loading
/// (progress + soft placeholder) and error (a themed placeholder
/// instead of Flutter's default broken-image icon).
class _RecipeImage extends StatelessWidget {
  final String imageUrl;

  const _RecipeImage({required this.imageUrl});

  static const Color _secondary = Color(0xFFEEE4E4);
  static const Color _primary = Color(0xFFF70707);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          color: _secondary,
          alignment: Alignment.center,
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: const AlwaysStoppedAnimation<Color>(_primary),
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                      (progress.expectedTotalBytes ?? 1)
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
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
