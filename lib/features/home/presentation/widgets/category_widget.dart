// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';

// class CategoryWidget extends StatelessWidget {
//   final List<String> names;
//   final List<IconData> icons;
//   final ValueChanged<String>? onCategoryTap;

//   const CategoryWidget({
//     super.key,
//     required this.names,
//     required this.icons,
//     this.onCategoryTap,
//   }) : assert(names.length == icons.length,
//             'names and icons must have the same length');

//   static const List<Color> _bgColors = [
//     Color(0xFFFFF0EC),
//     Color(0xFFFFF3E0),
//     Color(0xFFFFEBE5),
//     Color(0xFFFFF8E1),
//     Color(0xFFFFE8DE),
//     Color(0xFFFFEFD5),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.background,
//       padding: const EdgeInsets.symmetric(vertical: 14),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           children: List.generate(names.length, (index) {
//             final name = names[index];
//             final icon = icons[index];
//             final bgColor = _bgColors[index % _bgColors.length];
//             return Padding(
//               padding: const EdgeInsets.only(right: 22),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(36),
//                 onTap: () => onCategoryTap?.call(name),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 64,
//                       height: 64,
//                       decoration: BoxDecoration(
//                         color: bgColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         icon,
//                         color: const Color(0xFFE23F1C),
//                         size: 28,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       name,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF212121),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// import '../../../../app/theme/app_colors.dart';

// class CategoryWidget extends StatelessWidget {
//   final List<String> names;
//   final List<IconData> icons;
//   final ValueChanged<String>? onCategoryTap;

//   const CategoryWidget({
//     super.key,
//     required this.names,
//     required this.icons,
//     this.onCategoryTap,
//   }) : assert(
//           names.length == icons.length,
//           'names and icons must have the same length',
//         );

//   // Stronger and more visible colors
//   static const List<Color> _cardColors = [
//     Color(0xFFFFE1D8),
//     Color(0xFFFFE9C7),
//     Color(0xFFFFDDD5),
//     Color(0xFFFFE8C4),
//     Color(0xFFFFDCCF),
//     Color(0xFFFFE4C2),
//   ];

//   static const Color _primaryRed = AppColors.error;
//   static const Color _textColor = AppColors.black;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: AppColors.background,
//       padding: const EdgeInsets.fromLTRB(
//         14,
//         8,
//         14,
//         14,
//       ),
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: names.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           childAspectRatio: 2.65,
//         ),
//         itemBuilder: (context, index) {
//           final String name = names[index];
//           final IconData icon = icons[index];

//           final Color cardColor =
//               _cardColors[index % _cardColors.length];

//           return Material(
//             color: Colors.transparent,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(18),
//               onTap: () => onCategoryTap?.call(name),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: cardColor,
//                   borderRadius: BorderRadius.circular(18),

//                   // Slight border makes the card visible
//                   // even on a very light background.
//                   border: Border.all(
//                     color: AppColors.background,
//                     width: 1,
//                   ),

//                   boxShadow: [
//                     BoxShadow(
//                       color: _primaryRed.withOpacity(0.08),
//                       blurRadius: 8,
//                       spreadRadius: 0,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 8,
//                   ),
//                   child: Row(
//                     children: [
//                       // ─────────────────────────
//                       // ICON
//                       // ─────────────────────────
//                       Container(
//                         width: 46,
//                         height: 46,
//                         decoration: BoxDecoration(
//                           color: AppColors.background,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.black,
//                               blurRadius: 5,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Icon(
//                             icon,
//                             color: _primaryRed,
//                             size: 23,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 10),

//                       // ─────────────────────────
//                       // CATEGORY NAME
//                       // ─────────────────────────
//                       Expanded(
//                         child: Text(
//                           name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             color: _textColor,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w700,
//                             letterSpacing: 0.1,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 5),

//                       // ─────────────────────────
//                       // ARROW
//                       // ─────────────────────────
//                       Container(
//                         width: 25,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: AppColors.background.withOpacity(0.65),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.arrow_forward_ios_rounded,
//                           size: 10,
//                           color: _primaryRed,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CategoryWidget extends StatefulWidget {
//   final List<String> names;
//   final ValueChanged<String>? onCategoryTap;

//   final int? selectedIndex;

//   const CategoryWidget({
//     super.key,
//     required this.names,
//     this.onCategoryTap,
//     this.selectedIndex,
//   });

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
  
//   static const Color _primary = Color(0xFFf70707);
//   static const Color _secondary = Color(0xFFEEE4E4);
//   static const Color _background = Color(0xFFffffff);
//   static const Color _black = Color(0xFF000000);
//   static const Color _grey = Color(0xFF9E9E9E);

//   // Accent used for the selected state
//   static const Color _accent = _primary;

  
//   static const List<String> _categoryImageUrls = [
//     'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=200&q=80', // For You
//     'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200&q=80', // Rice
//     'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=200&q=80', // Spices
//     'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=200&q=80', // For You
//     'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200&q=80', // Rice
//     'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=200&q=80', // Spices
//   ];


//   static const List<IconData> _fallbackIcons = [
//     Icons.grid_view_rounded,
//     Icons.rice_bowl_outlined,
//     Icons.blender_outlined,
//     Icons.grid_view_rounded,
//     Icons.rice_bowl_outlined,
//     Icons.blender_outlined,
//   ];

//   late int _internalSelectedIndex;

//   @override
//   void initState() {
//     super.initState();
//     _internalSelectedIndex = widget.selectedIndex ?? 0;
//   }

//   @override
//   void didUpdateWidget(covariant CategoryWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.selectedIndex != null &&
//         widget.selectedIndex != oldWidget.selectedIndex) {
//       _internalSelectedIndex = widget.selectedIndex!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: _background,
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       // Fixed, generous height so the image + label + underline
//       // never overflow, regardless of device text-scale settings.
//       height: 108,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.symmetric(horizontal: 14),
//         itemCount: widget.names.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 18),
//         itemBuilder: (context, index) {
//           final String name = widget.names[index];
//           final bool isSelected = index == _internalSelectedIndex;

//           final String? imageUrl = index < _categoryImageUrls.length
//               ? _categoryImageUrls[index]
//               : null;
//           final IconData fallbackIcon = index < _fallbackIcons.length
//               ? _fallbackIcons[index]
//               : Icons.category_rounded;

//           return Material(
//             color: Colors.transparent,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(18),
//               onTap: () {
//                 setState(() {
//                   _internalSelectedIndex = index;
//                 });
//                 widget.onCategoryTap?.call(name);
//               },
//               child: SizedBox(
//                 width: 72,
//                 height: 92,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // ─────────────────────────
//                     // CIRCULAR CATEGORY IMAGE
//                     // ─────────────────────────
//                     AnimatedContainer(
//                       duration: const Duration(milliseconds: 180),
//                       width: 60,
//                       height: 60,
//                       padding: const EdgeInsets.all(2.5),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         // Soft ring that lights up in the accent
//                         // colour when this category is selected.
//                         border: Border.all(
//                           color: isSelected ? _accent : Colors.transparent,
//                           width: 2,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: _black.withOpacity(0.08),
//                             blurRadius: 8,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Container(
//                           color: _secondary,
//                           child: _CategoryImage(
//                             imageUrl: imageUrl,
//                             fallbackIcon: fallbackIcon,
//                             iconColor: isSelected ? _accent : _grey,
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 6),

//                     // ─────────────────────────
//                     // CATEGORY NAME
//                     // ─────────────────────────
//                     Text(
//                       name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: isSelected
//                             ? FontWeight.w700
//                             : FontWeight.w500,
//                         color: isSelected ? _black : _grey,
//                       ),
//                     ),

//                     const SizedBox(height: 3),

//                     // ─────────────────────────
//                     // SELECTED UNDERLINE
//                     // ─────────────────────────
//                     Container(
//                       height: 3,
//                       width: isSelected ? 22 : 0,
//                       decoration: BoxDecoration(
//                         color: _accent,
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /// Handles the three states of a network image cleanly:
// /// loading (small spinner), loaded (the photo), and error/missing
// /// (falls back to a themed icon so the UI never looks "broken").
// class _CategoryImage extends StatelessWidget {
//   final String? imageUrl;
//   final IconData fallbackIcon;
//   final Color iconColor;

//   const _CategoryImage({
//     required this.imageUrl,
//     required this.fallbackIcon,
//     required this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (imageUrl == null || imageUrl!.isEmpty) {
//       return Center(child: Icon(fallbackIcon, size: 26, color: iconColor));
//     }

//     return Image.network(
//       imageUrl!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       loadingBuilder: (context, child, progress) {
//         if (progress == null) return child;
//         return Center(
//           child: SizedBox(
//             width: 18,
//             height: 18,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               valueColor: AlwaysStoppedAnimation<Color>(iconColor),
//               value: progress.expectedTotalBytes != null
//                   ? progress.cumulativeBytesLoaded /
//                         (progress.expectedTotalBytes ?? 1)
//                   : null,
//             ),
//           ),
//         );
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return Center(child: Icon(fallbackIcon, size: 26, color: iconColor));
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final List<String> names;
  final ValueChanged<String>? onCategoryTap;

  /// Optional: pass an index if you want the parent to control
  /// which category is selected. If null, the widget manages its
  /// own selection state internally (defaults to index 0).
  final int? selectedIndex;

  const CategoryWidget({
    super.key,
    required this.names,
    this.onCategoryTap,
    this.selectedIndex,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  // ─────────────────────────────────────────────
  // APP COLOURS (same values as AppColors, kept
  // static right here so this page has no
  // dependency on the app_colors.dart import)
  // ─────────────────────────────────────────────
  static const Color _primary = Color(0xFFf70707);
  static const Color _secondary = Color(0xFFEEE4E4);
  static const Color _background = Color(0xFFffffff);
  static const Color _black = Color(0xFF000000);
  static const Color _grey = Color(0xFF9E9E9E);

  // Accent used for the selected state
  static const Color _accent = _primary;

  // ─────────────────────────────────────────────
  // CATEGORY IMAGES — set here, index-matched with
  // the `names` list passed from the parent page.
  // Replace these URLs with your own CDN / product
  // image links whenever you're ready — the layout
  // and fallback behaviour won't need to change.
  //
  // If a URL is missing, empty, or fails to load,
  // the widget automatically falls back to a clean
  // initials avatar (built from the category name)
  // instead of a broken image or a generic icon.
  // ─────────────────────────────────────────────
  static const List<String> _categoryImageUrls = [
    'https://images.unsplash.com/photo-1490818387583-1baba5e638af?w=200&q=80', // For You
    'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=200&q=80', // Rice
    'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=200&q=80', // Spices
  ];

  late int _internalSelectedIndex;

  @override
  void initState() {
    super.initState();
    _internalSelectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  void didUpdateWidget(covariant CategoryWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != null &&
        widget.selectedIndex != oldWidget.selectedIndex) {
      _internalSelectedIndex = widget.selectedIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _background,
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Fixed, generous height so the avatar + label + underline
      // never overflow, regardless of device text-scale settings.
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: widget.names.length,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          final String name = widget.names[index];
          final bool isSelected = index == _internalSelectedIndex;

          final String? imageUrl = index < _categoryImageUrls.length
              ? _categoryImageUrls[index]
              : null;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                setState(() {
                  _internalSelectedIndex = index;
                });
                widget.onCategoryTap?.call(name);
              },
              child: SizedBox(
                width: 72,
                height: 92,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ─────────────────────────
                    // CIRCULAR CATEGORY AVATAR
                    // ─────────────────────────
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // Soft ring that lights up in the accent
                        // colour when this category is selected.
                        border: Border.all(
                          color: isSelected ? _accent : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: _CategoryImage(
                          imageUrl: imageUrl,
                          name: name,
                          isSelected: isSelected,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    // ─────────────────────────
                    // CATEGORY NAME
                    // ─────────────────────────
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected ? _black : _grey,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // ─────────────────────────
                    // SELECTED UNDERLINE
                    // ─────────────────────────
                    Container(
                      height: 3,
                      width: isSelected ? 22 : 0,
                      decoration: BoxDecoration(
                        color: _accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Handles the states of the category avatar:
/// loading (small spinner over the initials bg), loaded (the photo),
/// and missing/error — falls back to a clean text-initials avatar
/// built from the category name (e.g. "For You" -> "FY") instead
/// of a broken image or a generic icon.
class _CategoryImage extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final bool isSelected;

  const _CategoryImage({
    required this.imageUrl,
    required this.name,
    required this.isSelected,
  });

  static const Color _primary = Color(0xFFf70707);
  static const Color _secondary = Color(0xFFEEE4E4);

  String get _initials {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.isEmpty || words.first.isEmpty) return '?';
    if (words.length == 1) {
      return words.first.length >= 2
          ? words.first.substring(0, 2).toUpperCase()
          : words.first.substring(0, 1).toUpperCase();
    }
    return (words[0][0] + words[1][0]).toUpperCase();
  }

  Widget _initialsAvatar() {
    return Container(
      color: isSelected ? _primary.withOpacity(0.12) : _secondary,
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          color: isSelected ? _primary : const Color(0xFF6B6B6B),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _initialsAvatar();
    }

    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Stack(
          fit: StackFit.expand,
          children: [
            _initialsAvatar(),
            Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isSelected ? _primary : const Color(0xFF6B6B6B),
                  ),
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          (progress.expectedTotalBytes ?? 1)
                      : null,
                ),
              ),
            ),
          ],
        );
      },
      errorBuilder: (context, error, stackTrace) => _initialsAvatar(),
    );
  }
}
