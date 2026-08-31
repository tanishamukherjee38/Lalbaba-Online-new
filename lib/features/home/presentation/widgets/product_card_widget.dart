import 'package:flutter/material.dart';

// Single product card — reused by trending_widget.dart,
// popular_search_widget.dart, and best_seller_widget.dart.
// No external model used — just plain fields (name, imageUrl, price,
// rating) so this file has zero dependency on anything under core/models.
//
// IMPORTANT LAYOUT NOTE:
// The inner Column uses `mainAxisSize: MainAxisSize.min` and a fixed-height
// SizedBox for the image instead of Expanded. Expanded only works when the
// parent gives a bounded height, which a Row/Column inside a ListView
// (shrink-wrapped) does NOT provide — using Expanded there caused the
// "RenderFlex children have non-zero flex but incoming height constraints
// are unbounded" crash. Keep it this way.
class ProductCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final double rating;
  final bool showPriceAndRating;
  final VoidCallback? onTap;
  final double width;
  final double imageHeight;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    this.price = '',
    this.rating = 0,
    this.showPriceAndRating = false,
    this.onTap,
    this.width = 130,
    this.imageHeight = 110,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: Container(
                color: Colors.grey.shade100,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            if (showPriceAndRating)
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    if (rating > 0)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star,
                              size: 12, color: Colors.orange),
                          Text(
                            ' $rating',
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
