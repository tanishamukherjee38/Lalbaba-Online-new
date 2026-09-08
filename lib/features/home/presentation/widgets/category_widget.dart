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
//       // Fixed, generous height so the avatar + label + underline
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
//                     // CIRCULAR CATEGORY AVATAR
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
//                         child: _CategoryImage(
//                           imageUrl: imageUrl,
//                           name: name,
//                           isSelected: isSelected,
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
//                         fontWeight:
//                             isSelected ? FontWeight.w700 : FontWeight.w500,
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

// class _CategoryImage extends StatelessWidget {
//   final String? imageUrl;
//   final String name;
//   final bool isSelected;

//   const _CategoryImage({
//     required this.imageUrl,
//     required this.name,
//     required this.isSelected,
//   });

//   static const Color _primary = Color(0xFFf70707);
//   static const Color _secondary = Color(0xFFEEE4E4);

//   Widget _initialsAvatar() {
//     return Container(
//       color: isSelected ? _primary.withOpacity(0.12) : _secondary,
//       alignment: Alignment.center,

//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (imageUrl == null || imageUrl!.isEmpty) {
//       return _initialsAvatar();
//     }

//     return Image.network(
//       imageUrl!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       loadingBuilder: (context, child, progress) {
//         if (progress == null) return child;
//         return Stack(
//           fit: StackFit.expand,
//           children: [
//             _initialsAvatar(),
//             Center(
//               child: SizedBox(
//                 width: 16,
//                 height: 16,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     isSelected ? _primary : const Color(0xFF6B6B6B),
//                   ),
//                   value: progress.expectedTotalBytes != null
//                       ? progress.cumulativeBytesLoaded /
//                           (progress.expectedTotalBytes ?? 1)
//                       : null,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//       errorBuilder: (context, error, stackTrace) => _initialsAvatar(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final List<String> names;
  final ValueChanged<String>? onCategoryTap;

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
  static const Color _primary = Color(0xFFf70707);
  static const Color _background = Color(0xFFffffff);
  static const Color _black = Color(0xFF212121);
  static const Color _grey = Color(0xFF6B6B6B);
  static const Color _border = Color(0xFFE6E6E6);

  // Accent used for the selected state
  static const Color _accent = _primary;

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
      padding: const EdgeInsets.symmetric(vertical: 10),
      // Fixed height — comfortably fits the pill + its shadow at
      // any device text-scale setting.
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.names.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final String name = widget.names[index];
          final bool isSelected = index == _internalSelectedIndex;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                setState(() {
                  _internalSelectedIndex = index;
                });
                widget.onCategoryTap?.call(name);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? _accent : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isSelected ? _accent : _border,
                    width: 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: _accent.withValues(alpha: 0.30),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                alignment: Alignment.center,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected ? Colors.white : _grey,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
