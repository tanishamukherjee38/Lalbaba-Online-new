// // Product image widget. Why: Isolate product image presentation and behavior.
// import 'package:flutter/material.dart';

// // ==============================================================================
// // PRODUCT IMAGE HEADER (Image + Favourite icon + Name)
// // ==============================================================================

// class ProductImageHeader extends StatefulWidget {
//   final String imageUrl;
//   final String name;

//   const ProductImageHeader({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//   });

//   @override
//   State<ProductImageHeader> createState() => _ProductImageHeaderState();
// }

// class _ProductImageHeaderState extends State<ProductImageHeader> {
//   bool favourite = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // IMAGE
//         SizedBox(
//           height: 158,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: Image.network(
//                   widget.imageUrl,
//                   fit: BoxFit.contain,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return const Center(
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Center(
//                       child: Icon(Icons.broken_image, color: Colors.grey),
//                     );
//                   },
//                 ),
//               ),
//               Positioned(
//                 top: 7,
//                 right: 7,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       favourite = !favourite;
//                     });
//                   },
//                   child: Icon(
//                     favourite ? Icons.favorite : Icons.favorite_border,
//                     color: favourite ? const Color(0xFFE23F1C) : Colors.grey,
//                     size: 23,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // NAME
//         SizedBox(
//           height: 31,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 7),
//             child: Text(
//               widget.name,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_shimmer.dart';


// ==============================================================================
// PRODUCT IMAGE HEADER (Image + Favourite icon + Name)
// ==============================================================================

class ProductImageHeader extends StatefulWidget {
  final String imageUrl;
  final String name;

  const ProductImageHeader({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  State<ProductImageHeader> createState() => _ProductImageHeaderState();
}

class _ProductImageHeaderState extends State<ProductImageHeader> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // IMAGE
        SizedBox(
          height: 158,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    // IMAGE LOADING SHIMMER
                    return const AppShimmer(
                      width: double.infinity,
                      height: 158,
                      radius: 0,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      favourite = !favourite;
                    });
                  },
                  child: Icon(
                    favourite ? Icons.favorite : Icons.favorite_border,
                    color: favourite ? const Color(0xFFE23F1C) : Colors.grey,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
        ),

        // NAME
        SizedBox(
          height: 31,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}