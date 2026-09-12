// Cart item widget. Why: Display one cart item as a reusable UI component.
import 'package:flutter/material.dart';

class SubCategoryWidget extends StatelessWidget {
  final List<String> items;
  final String selectedCategory;
  final ValueChanged<String>? onItemTap;

  const SubCategoryWidget({
    super.key,
    required this.items,
    required this.selectedCategory,
    this.onItemTap,
  });

  static const Color _primary = Color(0xFFF70707);
  static const Color _background = Color(0xFFFFFFFF);
  static const Color _textColor = Color(0xFF212121);
  static const Color _subTextColor = Color(0xFF757575);
  static const Color _borderColor = Color(0xFFEAEAEA);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _buildEmptyState();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            children: [
              Container(
                width: 4,
                height: 22,
                decoration: BoxDecoration(
                  color: _primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  '$selectedCategory Varieties',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _textColor,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Choose your preferred variety',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: _subTextColor,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // Sub-category grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.8,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return _SubCategoryCard(
                title: item,
                onTap: () {
                  onItemTap?.call(item);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 30,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                color: _primary,
                size: 28,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'No products available',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubCategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SubCategoryCard({
    required this.title,
    required this.onTap,
  });

  static const Color _primary = Color(0xFFF70707);
  static const Color _textColor = Color(0xFF212121);
  static const Color _borderColor = Color(0xFFEAEAEA);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _borderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            child: Row(
              children: [
                // Small leading icon
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: _primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.rice_bowl_outlined,
                    size: 19,
                    color: _primary,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: _textColor,
                    ),
                  ),
                ),

                const SizedBox(width: 4),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}