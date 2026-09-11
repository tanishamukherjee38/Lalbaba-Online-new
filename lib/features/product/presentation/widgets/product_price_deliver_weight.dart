


import 'package:flutter/material.dart';

// ==============================================================================
// PRODUCT PRICE INFO
// ==============================================================================

class ProductPriceInfo
    extends StatelessWidget {
  final String weight;
  final double price;
  final int deliveryDays;
  final VoidCallback onWeightTap;

  const ProductPriceInfo({
    super.key,
    required this.weight,
    required this.price,
    required this.deliveryDays,
    required this.onWeightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ============================================
        // WEIGHT
        // ============================================

        GestureDetector(
          onTap: onWeightTap,
          child: Container(
            height: 34,
            margin:
                const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            padding:
                const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    Colors.grey.shade400,
              ),
              borderRadius:
                  BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$weight - Rs ${price.toStringAsFixed(2)}',
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons
                      .keyboard_arrow_down,
                  size: 18,
                ),
              ],
            ),
          ),
        ),

        // ============================================
        // PRICE
        // ============================================

        SizedBox(
          height: 22,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            child: Align(
              alignment:
                  Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment:
                    Alignment.centerLeft,
                child: Text(
                  '₹${price.toStringAsFixed(2)}',
                  maxLines: 1,
                  style:
                      const TextStyle(
                    fontSize: 14,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        // ============================================
        // DELIVERY
        // ============================================

        SizedBox(
          height: 28,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons
                      .local_shipping_outlined,
                  size: 15,
                  color: Colors.green,
                ),
                const SizedBox(width: 4),

                Expanded(
                  child: Text(
                    'Delivery in $deliveryDays days',
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        const TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}