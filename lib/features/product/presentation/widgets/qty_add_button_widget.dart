// import 'package:flutter/material.dart';

// // ==============================================================================
// // QTY + ADD BUTTON
// // ==============================================================================

// class QtyAddButton extends StatefulWidget {
//   final ValueChanged<int> onAddToCart;

//   const QtyAddButton({
//     super.key,
//     required this.onAddToCart,
//   });

//   @override
//   State<QtyAddButton> createState() => _QtyAddButtonState();
// }

// class _QtyAddButtonState extends State<QtyAddButton> {
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 31,
//       child: Row(
//         children: [
//           // QUANTITY
//           Container(
//             height: 29,
//             margin: const EdgeInsets.only(left: 7),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade400),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 4),
//                   child: Text('Qty', style: TextStyle(fontSize: 10)),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (quantity > 1) {
//                       setState(() {
//                         quantity--;
//                       });
//                     }
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Icon(Icons.remove, size: 14),
//                   ),
//                 ),
//                 Text(
//                   '$quantity',
//                   style: const TextStyle(
//                     fontSize: 11,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       quantity++;
//                     });
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Icon(Icons.add, size: 14),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(width: 5),

//           // ADD
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 7),
//               child: SizedBox(
//                 height: 29,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     widget.onAddToCart(quantity);
//                     setState(() {
//                       quantity = 1;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFE23F1C),
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                   child: const Text(
//                     'ADD',
//                     style: TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


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
  State<QtyAddButton> createState() =>
      _QtyAddButtonState();
}

class _QtyAddButtonState
    extends State<QtyAddButton> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool compact =
              constraints.maxWidth < 155;

          final double qtyWidth =
              compact ? 76 : 96;

          return Row(
            children: [
              const SizedBox(width: 7),

              // ==============================================
              // QUANTITY
              // ==============================================

              SizedBox(
                width: qtyWidth,
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Colors.grey.shade400,
                    ),
                    borderRadius:
                        BorderRadius.circular(
                      4,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                    children: [
                      if (!compact)
                        const Text(
                          'Qty',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),

                      _smallTapButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),

                      Flexible(
                        child: Text(
                          '$quantity',
                          maxLines: 1,
                          style:
                              const TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),

                      _smallTapButton(
                        icon: Icons.add,
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 5),

              // ==============================================
              // ADD BUTTON
              // ==============================================

              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(
                    right: 7,
                  ),
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onAddToCart(
                          quantity,
                        );

                        setState(() {
                          quantity = 1;
                        });
                      },
                      style:
                          ElevatedButton
                              .styleFrom(
                        backgroundColor:
                            const Color(
                          0xFFE23F1C,
                        ),
                        foregroundColor:
                            Colors.white,

                        // IMPORTANT:
                        // ElevatedButton-er default
                        // minimum width remove kora holo.
                        minimumSize:
                            Size.zero,

                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 4,
                        ),

                        tapTargetSize:
                            MaterialTapTargetSize
                                .shrinkWrap,

                        visualDensity:
                            VisualDensity
                                .compact,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                            4,
                          ),
                        ),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'ADD',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _smallTapButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(20),
      child: Padding(
        padding:
            const EdgeInsets.all(3),
        child: Icon(
          icon,
          size: 14,
        ),
      ),
    );
  }
}