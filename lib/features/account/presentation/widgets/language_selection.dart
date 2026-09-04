import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'app_string.dart';
import 'languange_constant.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.translate_rounded, size: 22),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              AppStrings.language,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),

          _LanguageButton(
            text: 'EN',
            active: AppLanguageConstants.current == AppLanguage.english,
            onTap: () => AppLanguageConstants.change(AppLanguage.english),
          ),

          const SizedBox(width: 6),

          _LanguageButton(
            text: 'বাং',
            active: AppLanguageConstants.current == AppLanguage.bengali,
            onTap: () => AppLanguageConstants.change(AppLanguage.bengali),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String text;
  final bool active;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.text,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.error : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import 'app_string.dart';
// import 'languange_constant.dart';

// /// Standalone page for choosing the app language (English / Bengali).
// /// Reads/writes AppLanguageConstants.current directly; all label text
// /// comes from AppStrings.
// class LanguageSelectionPage extends StatefulWidget {
//   const LanguageSelectionPage({super.key});

//   @override
//   State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
// }

// class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
//   late AppLanguage _selected = AppLanguageConstants.current;

//   void _select(AppLanguage lang) {
//     setState(() => _selected = lang);
//     AppLanguageConstants.current = lang; // pull point for other pages
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       // appBar: AppBar(
//       //   backgroundColor: AppColors.background,
//       //   elevation: 0,
//       //   scrolledUnderElevation: 0,
//       //   iconTheme: const IconThemeData(color: Colors.black87),
//       //   title: Text(
//       //     AppStrings.selectLanguage,
//       //     style: const TextStyle(
//       //       color: Colors.black87,
//       //       fontSize: 17,
//       //       fontWeight: FontWeight.w600,
//       //     ),
//       //   ),
//       // ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Text(
//           //   AppStrings.selectLanguageSubtitle,
//           //   style: const TextStyle(fontSize: 13, color: Colors.grey),
//           // ),
//           // const SizedBox(height: 20),
//           _LanguageOptionTile(
//             title: 'English',
//             subtitle: 'English (US)',
//             selected: _selected == AppLanguage.english,
//             onTap: () => _select(AppLanguage.english),
//           ),
//           const SizedBox(height: 12),
//           _LanguageOptionTile(
//             title: 'বাংলা',
//             subtitle: 'Bengali',
//             selected: _selected == AppLanguage.bengali,
//             onTap: () => _select(AppLanguage.bengali),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _LanguageOptionTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final bool selected;
//   final VoidCallback onTap;

//   const _LanguageOptionTile({
//     required this.title,
//     required this.subtitle,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(14),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 150),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: BoxDecoration(
//           color: selected ? AppColors.error.withOpacity(0.06) : Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: selected ? AppColors.error : const Color(0xFFE5E5E5),
//             width: selected ? 1.4 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: selected ? AppColors.error : Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     subtitle,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 22,
//               height: 22,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: selected ? AppColors.error : Colors.grey,
//                   width: 1.6,
//                 ),
//                 color: selected ? AppColors.error : Colors.transparent,
//               ),
//               child: selected
//                   ? const Icon(Icons.check, size: 14, color: Colors.white)
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
