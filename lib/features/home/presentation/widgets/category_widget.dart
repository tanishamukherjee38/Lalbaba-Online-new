

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
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final List<String> names;
  final List<IconData> icons;
  final ValueChanged<String>? onCategoryTap;

  const CategoryWidget({
    super.key,
    required this.names,
    required this.icons,
    this.onCategoryTap,
  }) : assert(
          names.length == icons.length,
          'names and icons must have the same length',
        );

  // Stronger and more visible colors
  static const List<Color> _cardColors = [
    Color(0xFFFFE1D8),
    Color(0xFFFFE9C7),
    Color(0xFFFFDDD5),
    Color(0xFFFFE8C4),
    Color(0xFFFFDCCF),
    Color(0xFFFFE4C2),
  ];

  static const Color _primaryRed = AppColors.error;
  static const Color _textColor = AppColors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(
        14,
        8,
        14,
        14,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: names.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.65,
        ),
        itemBuilder: (context, index) {
          final String name = names[index];
          final IconData icon = icons[index];

          final Color cardColor =
              _cardColors[index % _cardColors.length];

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => onCategoryTap?.call(name),
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),

                  // Slight border makes the card visible
                  // even on a very light background.
                  border: Border.all(
                    color: AppColors.background,
                    width: 1,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: _primaryRed.withOpacity(0.08),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      // ─────────────────────────
                      // ICON
                      // ─────────────────────────
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            icon,
                            color: _primaryRed,
                            size: 23,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // ─────────────────────────
                      // CATEGORY NAME
                      // ─────────────────────────
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      // ─────────────────────────
                      // ARROW
                      // ─────────────────────────
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(0.65),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 10,
                          color: _primaryRed,
                        ),
                      ),
                    ],
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