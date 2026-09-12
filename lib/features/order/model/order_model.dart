enum OrderStatus { processing, shipped, delivered, cancelled }

enum TrackingState { completed, current, pending }

class OrderItemModel {
  const OrderItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.mrp,
    required this.discountedMrp,
    this.isGift = false,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String weight;
  final double mrp;
  final double discountedMrp;
  final bool isGift;
}

class OrderPriceBreakup {
  const OrderPriceBreakup({
    required this.totalMrp,
    required this.discountedTotalMrp,
    required this.shippingCharges,
    required this.tax,
  });

  final double totalMrp;
  final double discountedTotalMrp;
  final double shippingCharges;
  final double tax;

  double get youSaved => totalMrp - discountedTotalMrp;
  double get orderTotal => discountedTotalMrp + shippingCharges + tax;
}

class TrackingEvent {
  const TrackingEvent({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.state,
  });

  final String title;
  final String description;
  final DateTime timestamp;
  final TrackingState state;
}

class OrderModel {
  const OrderModel({
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.items,
    required this.customerName,
    required this.customerPhone,
    required this.deliveryAddress,
    required this.paymentMode,
    required this.priceBreakup,
    this.deliveredDate,
    this.onTime = false,
    this.deliveryPartner = '',
    this.trackingId = '',
    this.trackingEvents = const [],
  });

  final String orderId;
  final DateTime orderDate;
  final OrderStatus status;
  final List<OrderItemModel> items;
  final String customerName;
  final String customerPhone;
  final String deliveryAddress;
  final String paymentMode;
  final OrderPriceBreakup priceBreakup;
  final DateTime? deliveredDate;
  final bool onTime;
  final String deliveryPartner;
  final String trackingId;
  final List<TrackingEvent> trackingEvents;

  OrderModel copyWith({OrderStatus? status}) => OrderModel(
        orderId: orderId,
        orderDate: orderDate,
        status: status ?? this.status,
        items: items,
        customerName: customerName,
        customerPhone: customerPhone,
        deliveryAddress: deliveryAddress,
        paymentMode: paymentMode,
        priceBreakup: priceBreakup,
        deliveredDate: deliveredDate,
        onTime: onTime,
        deliveryPartner: deliveryPartner,
        trackingId: trackingId,
        trackingEvents: trackingEvents,
      );
}
