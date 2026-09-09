import 'package:flutter/material.dart';

import '../../../../core/constants/asset_constants.dart';
import '../widget/product_categories_search_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12,
        ),
        child: SearchWidget(
          categories: const [
            'Minikit',
            'Banskathi',
            'Chamanmani',
            'Basmati',
            'Gobindo Bhog',
            'Jeera Rice',
          ],
          products: [
            {
              'name': 'Lalbaba Superior Banskati',
              'price': '₹139.00',
              'imageUrl': AssetConstants.baskati,
            },
            {
              'name': 'Lalbaba Superior Ratna',
              'price': '₹1,029.00',
              'imageUrl': AssetConstants.ratna,
            },
            {
              'name': 'Lalbaba Superior Minikit',
              'price': '₹1,089.00',
              'imageUrl': AssetConstants.miniket,
            },
            {
              'name': 'Lalbaba Basmati Rice',
              'price': '₹230.00',
              'imageUrl': AssetConstants.basmoti,
            },
          ],
          onCategoryTap: (category) {
            debugPrint(
              'Category clicked: $category',
            );
          },
          onProductTap: (product) {
            debugPrint(
              'Product clicked: ${product['name']}',
            );
          },
        ),
      ),
    );
  }
}