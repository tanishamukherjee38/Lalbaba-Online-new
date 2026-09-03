import 'package:flutter/material.dart';

import '../../../../core/widgets/app_app_bar.dart';
import '../../../home/presentation/widgets/app_string.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: AppStrings.categories, centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop by Category',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 6),

              Text(
                'Explore our wide range of products',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),

              const SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final category = _categories[index];

                  return _CategoryCard(
                    title: category.title,
                    icon: category.icon,
                    onTap: () {
                      // TODO: Navigate to the selected category.
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem {
  final String title;
  final IconData icon;

  const _CategoryItem({required this.title, required this.icon});
}

const List<_CategoryItem> _categories = [
  _CategoryItem(title: 'Rice', icon: Icons.rice_bowl_outlined),
  _CategoryItem(title: 'Pulses', icon: Icons.grain),
  _CategoryItem(title: 'Flour', icon: Icons.bakery_dining_outlined),
  _CategoryItem(title: 'Spices', icon: Icons.local_fire_department_outlined),
  _CategoryItem(title: 'Oil', icon: Icons.water_drop_outlined),
  _CategoryItem(title: 'Dry Fruits', icon: Icons.eco_outlined),
  _CategoryItem(title: 'Grocery', icon: Icons.shopping_basket_outlined),
  _CategoryItem(title: 'Others', icon: Icons.category_outlined),
];
