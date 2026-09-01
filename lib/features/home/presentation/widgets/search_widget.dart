// import 'package:flutter/material.dart';

// // Home search bar.
// // Why: separated so it can later be reused on category/search-result
// // pages without dragging home_page.dart along with it.
// class SearchWidget extends StatelessWidget {
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onTap;
//   final String hintText;

//   const SearchWidget({
//     super.key,
//     this.controller,
//     this.onChanged,
//     this.onTap,
//     this.hintText = 'Search for rice, masala...',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         height: 44,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade400),
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: TextField(
//           controller: controller,
//           onChanged: onChanged,
//           onTap: onTap,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
//             prefixIcon: const Icon(Icons.search, color: Colors.grey),
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.symmetric(vertical: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// Standalone rounded search bar.
// Note: home_page.dart no longer calls this directly — the Flipkart-style
// redesign merges the search field into LalBabaAppBar itself. Keeping this
// widget around so it can still be reused on category/search-result pages.
class SearchWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String hintText;

  const SearchWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.hintText = 'Search for rice, masala...',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF878787)),
            prefixIcon: const Icon(Icons.search, color: Color(0xFF878787)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }
}
