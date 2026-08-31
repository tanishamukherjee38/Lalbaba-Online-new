import 'package:flutter/material.dart';

// Category row (Rice, Masala, ...) — Flipkart-style icon + label chips.
// No external model used — just plain parallel lists so this file has
// zero dependency on anything under core/models.
class CategoryWidget extends StatelessWidget {
  final List<String> names;
  final List<IconData> icons;
  final ValueChanged<String>? onCategoryTap;

  const CategoryWidget({
    super.key,
    required this.names,
    required this.icons,
    this.onCategoryTap,
  }) : assert(names.length == icons.length,
            'names and icons must have the same length');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(names.length, (index) {
          final name = names[index];
          final icon = icons[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => onCategoryTap?.call(name),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Icon(icon, color: const Color(0xFFE23F1C)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
