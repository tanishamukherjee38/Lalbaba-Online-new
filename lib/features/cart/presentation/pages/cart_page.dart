// // Cart page. Why: Contains the shopping cart user interface.
// import 'package:flutter/material.dart';

// import '../../../../core/widgets/app_app_bar.dart';
// import '../../../home/presentation/widgets/app_string.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.grey.shade100,
//       appBar: AppAppBar(title: AppStrings.cart, centerTitle: true),
//       body: const Center(
//         child: Text(
//           'Cart Page',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_app_bar.dart';
import '../../../home/presentation/widgets/app_string.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: AppStrings.cart),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                children: [
                  _CartItemCard(
                    productName: 'Premium Rice',
                    weight: '5 kg',
                    price: 420,
                    quantity: 1,
                    image: Icons.rice_bowl_outlined,
                  ),
                  const SizedBox(height: 12),
                  _CartItemCard(
                    productName: 'Premium Pulses',
                    weight: '1 kg',
                    price: 140,
                    quantity: 2,
                    image: Icons.grain,
                  ),
                  const SizedBox(height: 12),
                  _CartItemCard(
                    productName: 'Mustard Oil',
                    weight: '1 L',
                    price: 180,
                    quantity: 1,
                    image: Icons.water_drop_outlined,
                  ),
                ],
              ),
            ),

            _CartSummary(),
          ],
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final String productName;
  final String weight;
  final double price;
  final int quantity;
  final IconData image;

  const _CartItemCard({
    required this.productName,
    required this.weight,
    required this.price,
    required this.quantity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = price * quantity;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 78,
            width: 78,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              image,
              size: 38,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  weight,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 8),

                Text(
                  '₹${totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Column(
            children: [
              IconButton(
                onPressed: () {
                  // TODO: Remove the product from the cart.
                },
                icon: const Icon(Icons.delete_outline, size: 21),
                visualDensity: VisualDensity.compact,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // TODO: Decrease the product quantity.
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.remove, size: 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        // TODO: Increase the product quantity.
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  const _CartSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          _SummaryRow(title: 'Subtotal', value: '₹880'),
          const SizedBox(height: 8),
          _SummaryRow(title: 'Delivery', value: '₹40'),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade200),
          const SizedBox(height: 10),
          const _SummaryRow(title: 'Total', value: '₹920', isTotal: true),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to the checkout page.
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const _SummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 17 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
