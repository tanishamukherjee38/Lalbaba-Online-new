import 'package:flutter/material.dart';

// ==============================================================================
// QTY + ADD BUTTON
// ==============================================================================

class QtyAddButton extends StatefulWidget {
  final ValueChanged<int> onAddToCart;

  const QtyAddButton({
    super.key,
    required this.onAddToCart,
  });

  @override
  State<QtyAddButton> createState() => _QtyAddButtonState();
}

class _QtyAddButtonState extends State<QtyAddButton> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31,
      child: Row(
        children: [
          // QUANTITY
          Container(
            height: 29,
            margin: const EdgeInsets.only(left: 7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Qty', style: TextStyle(fontSize: 10)),
                ),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.remove, size: 14),
                  ),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.add, size: 14),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 5),

          // ADD
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: SizedBox(
                height: 29,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onAddToCart(quantity);
                    setState(() {
                      quantity = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE23F1C),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}