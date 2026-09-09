// import 'dart:async';

// import 'package:flutter/material.dart';

// class TestimonialWidget extends StatefulWidget {
//   final ValueChanged<int>? onReviewTap;

//   const TestimonialWidget({super.key, this.onReviewTap});

//   @override
//   State<TestimonialWidget> createState() => _TestimonialWidgetState();
// }

// class _TestimonialWidgetState extends State<TestimonialWidget> {
//   // ─────────────────────────────────────────────
//   // COLOURS (kept static here, same pattern as the
//   // other widgets in this app).
//   // ─────────────────────────────────────────────
//   static const Color _navy = Color(0xFF1E2A6E);
//   static const Color _black = Color(0xFF212121);
//   static const Color _grey = Color(0xFF6B6B6B);

//   // ─────────────────────────────────────────────
//   // REVIEWS — image + quote + reviewer name, set
//   // here so the home page only needs to drop in
//   // `TestimonialWidget()`. Add / edit any time;
//   // layout below won't need to change.
//   // ─────────────────────────────────────────────
//   static const List<Map<String, String>> _reviews = [
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/pZbNxM9gJAzjo8IdurZClyu6VmIiK7FX39jNrg4j.webp',
//       'quote':
//           'We loved the overall experience. The food is scrumptious! They were very courteous. We are regular customers now.',
//       'name': 'Jharna Bose (Homemaker)',
//     },
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/bURkWLeNCHrdLRsGW9HZHCIhPhvN6NbfT0kAnRLf.webp',
//       'quote':
//           'Good products, the company is very professional and helpful. Quick solution for the smallest problem.',
//       'name': 'Sana Khan (Homemaker)',
//     },
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/HiUcgKV7lcSs2SHhulqBb7ukhTY844mqzYl8fNnZ.webp',
//       'quote':
//           'As a caterer, consistency is everything. Lalbaba\'s quality never wavers — always reliable.',
//       'name': 'Priya Sharma (Catering Manager)',
//     },
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/k7XzoAL0hBmbXGiBggtgObemLqZs0Y44HbEdaUec.webp',
//       'quote':
//           'Perfect for biryani and pulao — long, consistent grains that give restaurant-style results at home.',
//       'name': 'Rajiv Mehra (Home Chef)',
//     },
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/rf8rf1loASwSeArbhayRZ7vZJepqwzJClfiOjEzw.webp',
//       'quote':
//           'Quick to cook and rice stays soft — my kids ask for Lalbaba rice every day.',
//       'name': 'Neha Roy (Homemaker)',
//     },
//     {
//       'imageUrl':
//           'https://lalbabaonline.com/public/uploads/all/Omd0y1GhNijua9gvV33wwGjpSYDnaJtdFHc9elRX.webp',
//       'quote':
//           'Excellent value — fragrant, non-sticky rice that my small restaurant customers love.',
//       'name': 'Subhajit Chatterjee (Restaurant Owner)',
//     },
//   ];

//   late final PageController _pageController;
//   Timer? _autoScrollTimer;
//   late final int _initialPage;

//   int get _reviewCount => _reviews.length;

//   @override
//   void initState() {
//     super.initState();

//     _initialPage = _reviewCount > 0 ? 10000 - (10000 % _reviewCount) : 0;

//     _pageController = PageController(
//       initialPage: _initialPage,
//       viewportFraction: 0.8,
//     );

//     if (_reviewCount > 1) {
//       _autoScrollTimer = Timer.periodic(
//         const Duration(seconds: 4),
//         (_) => _goToNext(),
//       );
//     }
//   }

//   void _goToNext() {
//     if (!_pageController.hasClients || _reviewCount <= 1) return;

//     final int currentPage = _pageController.page?.round() ?? _initialPage;

//     // Always move forward by one virtual page — same trick used in
//     // BannerWidget / RecipeWidget — so looping from the last review
//     // back to the first never looks like it's rewinding.
//     _pageController.animateToPage(
//       currentPage + 1,
//       duration: const Duration(milliseconds: 550),
//       curve: Curves.easeInOutCubic,
//     );
//   }

//   @override
//   void dispose() {
//     _autoScrollTimer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_reviewCount == 0) return const SizedBox.shrink();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ─────────────────────────
//         // HEADER
//         // ─────────────────────────
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Happy Home Chefs',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w800,
//                   color: _black,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 'Real stories from our customers. Read what '
//                 'people love about Lalbaba rice.',
//                 style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                   color: _grey,
//                   height: 1.4,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 16),

//         // ─────────────────────────
//         // REVIEW CARDS (auto-scrolling)
//         // ─────────────────────────
//         SizedBox(
//           height: 300,
//           child: PageView.builder(
//             controller: _pageController,
//             // Very large item count gives the infinite-scroll effect.
//             itemCount: 100000,
//             itemBuilder: (context, pageIndex) {
//               final int index = pageIndex % _reviewCount;
//               final review = _reviews[index];

//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 child: GestureDetector(
//                   onTap: () => widget.onReviewTap?.call(index),
//                   child: _ReviewCard(
//                     imageUrl: review['imageUrl']!,
//                     quote: review['quote']!,
//                     name: review['name']!,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ReviewCard extends StatelessWidget {
//   final String imageUrl;
//   final String quote;
//   final String name;

//   const _ReviewCard({
//     required this.imageUrl,
//     required this.quote,
//     required this.name,
//   });

//   static const Color _navy = Color(0xFF1E2A6E);
//   static const Color _black = Color(0xFF212121);
//   static const Color _grey = Color(0xFF6B6B6B);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ─────────────────────────
//           // IMAGE + "REVIEW" BADGE
//           // ─────────────────────────
//           Stack(
//             children: [
//               SizedBox(
//                 height: 170,
//                 width: double.infinity,
//                 child: _ReviewImage(imageUrl: imageUrl),
//               ),
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withValues(alpha: 0.12),
//                         blurRadius: 6,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: const Text(
//                     'Review',
//                     style: TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w700,
//                       color: _navy,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // ─────────────────────────
//           // QUOTE + NAME
//           // ─────────────────────────
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     quote,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 12.5,
//                       color: _grey,
//                       height: 1.4,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     name,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 13.5,
//                       fontWeight: FontWeight.w800,
//                       color: _black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Handles the states of a review image cleanly: loading (progress
// /// + soft placeholder) and error (a themed placeholder instead of
// /// Flutter's default broken-image icon).
// class _ReviewImage extends StatelessWidget {
//   final String imageUrl;

//   const _ReviewImage({required this.imageUrl});

//   static const Color _secondary = Color(0xFFEEE4E4);
//   static const Color _navy = Color(0xFF1E2A6E);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       imageUrl,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       loadingBuilder: (context, child, progress) {
//         if (progress == null) return child;
//         return Container(
//           color: _secondary,
//           alignment: Alignment.center,
//           child: SizedBox(
//             width: 22,
//             height: 22,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               valueColor: const AlwaysStoppedAnimation<Color>(_navy),
//               value: progress.expectedTotalBytes != null
//                   ? progress.cumulativeBytesLoaded /
//                         (progress.expectedTotalBytes ?? 1)
//                   : null,
//             ),
//           ),
//         );
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return Container(
//           color: _secondary,
//           alignment: Alignment.center,
//           child: const Icon(
//             Icons.image_not_supported_outlined,
//             color: _navy,
//             size: 26,
//           ),
//         );
//       },
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';

class TestimonialWidget extends StatefulWidget {
  final ValueChanged<int>? onReviewTap;

  const TestimonialWidget({
    super.key,
    this.onReviewTap,
  });

  @override
  State<TestimonialWidget> createState() => _TestimonialWidgetState();
}

class _TestimonialWidgetState extends State<TestimonialWidget> {
  static const Color _navy = Color(0xFF1E2A6E);
  static const Color _black = Color(0xFF212121);
  static const Color _grey = Color(0xFF6B6B6B);

  static const List<Map<String, String>> _reviews = [
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/pZbNxM9gJAzjo8IdurZClyu6VmIiK7FX39jNrg4j.webp',
      'quote':
          'We loved the overall experience. The food is scrumptious! They were very courteous. We are regular customers now.',
      'name': 'Jharna Bose (Homemaker)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/bURkWLeNCHrdLRsGW9HZHCIhPhvN6NbfT0kAnRLf.webp',
      'quote':
          'Good products, the company is very professional and helpful. Quick solution for the smallest problem.',
      'name': 'Sana Khan (Homemaker)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/HiUcgKV7lcSs2SHhulqBb7ukhTY844mqzYl8fNnZ.webp',
      'quote':
          'As a caterer, consistency is everything. Lalbaba\'s quality never wavers — always reliable.',
      'name': 'Priya Sharma (Catering Manager)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/k7XzoAL0hBmbXGiBggtgObemLqZs0Y44HbEdaUec.webp',
      'quote':
          'Perfect for biryani and pulao — long, consistent grains that give restaurant-style results at home.',
      'name': 'Rajiv Mehra (Home Chef)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/rf8rf1loASwSeArbhayRZ7vZJepqwzJClfiOjEzw.webp',
      'quote':
          'Quick to cook and rice stays soft — my kids ask for Lalbaba rice every day.',
      'name': 'Neha Roy (Homemaker)',
    },
    {
      'imageUrl':
          'https://lalbabaonline.com/public/uploads/all/Omd0y1GhNijua9gvV33wwGjpSYDnaJtdFHc9elRX.webp',
      'quote':
          'Excellent value — fragrant, non-sticky rice that my small restaurant customers love.',
      'name': 'Subhajit Chatterjee (Restaurant Owner)',
    },
  ];

  late final PageController _pageController;
  Timer? _autoScrollTimer;
  late final int _initialPage;

  int get _reviewCount => _reviews.length;

  @override
  void initState() {
    super.initState();

    _initialPage =
        _reviewCount > 0 ? 10000 - (10000 % _reviewCount) : 0;

    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 0.8,
    );

    if (_reviewCount > 1) {
      _autoScrollTimer = Timer.periodic(
        const Duration(seconds: 4),
        (_) => _goToNext(),
      );
    }
  }

  void _goToNext() {
    if (!_pageController.hasClients || _reviewCount <= 1) {
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

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_reviewCount == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Happy Home Chefs',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: _black,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Real stories from our customers. Read what people love about Lalbaba rice.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _grey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 100000,
            itemBuilder: (context, pageIndex) {
              final int index = pageIndex % _reviewCount;
              final review = _reviews[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    widget.onReviewTap?.call(index);
                  },
                  child: _ReviewCard(
                    imageUrl: review['imageUrl']!,
                    quote: review['quote']!,
                    name: review['name']!,
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

class _ReviewCard extends StatelessWidget {
  final String imageUrl;
  final String quote;
  final String name;

  const _ReviewCard({
    required this.imageUrl,
    required this.quote,
    required this.name,
  });

  static const Color _navy = Color(0xFF1E2A6E);
  static const Color _black = Color(0xFF212121);
  static const Color _grey = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: _ReviewImage(
                  imageUrl: imageUrl,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: 0.12,
                        ),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Review',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _navy,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                14,
                12,
                14,
                14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quote,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: _grey,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: _black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewImage extends StatelessWidget {
  final String imageUrl;

  const _ReviewImage({
    required this.imageUrl,
  });

  static const Color _secondary = Color(0xFFEEE4E4);
  static const Color _navy = Color(0xFF1E2A6E);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,

      // Loader removed
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? progress,
      ) {
        if (progress == null) {
          return child;
        }

        // Image load হওয়ার সময় শুধু placeholder থাকবে
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: _secondary,
        );
      },

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
            color: _navy,
            size: 26,
          ),
        );
      },
    );
  }
}