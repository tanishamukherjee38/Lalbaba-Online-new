// Order and order-item data models for the "My Orders" feature.
// Why: One typed source of truth so widgets/provider don't pass raw maps.

enum OrderStatus { processing, shipped, delivered, cancelled }

class OrderItemModel {
  const OrderItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    this.isGift = false,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String weight;
  final bool isGift;
}

class OrderModel {
  const OrderModel({
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.amount,
    required this.items,
    this.deliveredDate,
    this.onTime = false,
  });

  /// Lalbaba's own order number format, e.g. LB23090523133267.
  final String orderId;
  final DateTime orderDate;
  final OrderStatus status;
  final double amount;
  final List<OrderItemModel> items;
  final DateTime? deliveredDate;
  final bool onTime;

  OrderModel copyWith({OrderStatus? status}) {
    return OrderModel(
      orderId: orderId,
      orderDate: orderDate,
      status: status ?? this.status,
      amount: amount,
      items: items,
      deliveredDate: deliveredDate,
      onTime: onTime,
    );
  }
}
