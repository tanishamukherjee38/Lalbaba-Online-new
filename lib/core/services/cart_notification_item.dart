

class CartNotificationItem {
  final String? productId;

  final String name;

  final String imageUrl;

  final String price;

  final String? originalPrice;

  final String? weight;

  final int quantity;

  const CartNotificationItem({
    this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.originalPrice,
    this.weight,
    required this.quantity,
  });

  // ===========================================================================
  // UNIQUE KEY
  // ===========================================================================
  //
  // Same product + same weight
  // same cart item hisebe dhora hobe.
  //
  // Different weight hole separate item.
  // ===========================================================================

  String get uniqueKey {
    final String id =
        productId?.trim() ?? '';

    final String normalizedName =
        name.trim().toLowerCase();

    final String normalizedWeight =
        weight?.trim().toLowerCase() ?? '';

    if (id.isNotEmpty) {
      return '$id|$normalizedWeight';
    }

    return '$normalizedName|$normalizedWeight';
  }

  // ===========================================================================
  // COPY WITH
  // ===========================================================================

  CartNotificationItem copyWith({
    String? productId,
    String? name,
    String? imageUrl,
    String? price,
    String? originalPrice,
    String? weight,
    int? quantity,
  }) {
    return CartNotificationItem(
      productId:
          productId ?? this.productId,

      name:
          name ?? this.name,

      imageUrl:
          imageUrl ?? this.imageUrl,

      price:
          price ?? this.price,

      originalPrice:
          originalPrice ??
              this.originalPrice,

      weight:
          weight ?? this.weight,

      quantity:
          quantity ?? this.quantity,
    );
  }

  // ===========================================================================
  // TO JSON
  // ===========================================================================
  //
  // SharedPreferences-e save korar jonno.
  // ===========================================================================

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'originalPrice': originalPrice,
      'weight': weight,
      'quantity': quantity,
    };
  }

  // ===========================================================================
  // FROM JSON
  // ===========================================================================
  //
  // App restart hole SharedPreferences theke
  // abar model create korbe.
  // ===========================================================================

  factory CartNotificationItem.fromJson(
    Map<String, dynamic> json,
  ) {
    final dynamic quantityValue =
        json['quantity'];

    int parsedQuantity = 1;

    if (quantityValue is int) {
      parsedQuantity = quantityValue;
    } else if (quantityValue is num) {
      parsedQuantity =
          quantityValue.toInt();
    } else {
      parsedQuantity =
          int.tryParse(
            quantityValue?.toString() ??
                '',
          ) ??
          1;
    }

    return CartNotificationItem(
      productId:
          json['productId']
              ?.toString(),

      name:
          json['name']
              ?.toString() ??
          'Product',

      imageUrl:
          json['imageUrl']
              ?.toString() ??
          '',

      price:
          json['price']
              ?.toString() ??
          '',

      originalPrice:
          json['originalPrice']
              ?.toString(),

      weight:
          json['weight']
              ?.toString(),

      quantity:
          parsedQuantity <= 0
              ? 1
              : parsedQuantity,
    );
  }
}