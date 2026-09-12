import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lalbaba_online/features/order/model/order_model.dart' show OrderModel, OrderItemModel, OrderPriceBreakup, OrderStatus, TrackingState, TrackingEvent;

class OrdersNotifier extends StateNotifier<AsyncValue<List<OrderModel>>> {
  OrdersNotifier() : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(milliseconds: 1200));
      state = AsyncValue.data(_mockOrders());
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncValue.data([
      for (final order in current)
        if (order.orderId == orderId)
          order.copyWith(status: OrderStatus.cancelled)
        else
          order,
    ]);
  }

  List<OrderModel> _mockOrders() {
    return [
      OrderModel(
        orderId: 'LB23090523133267',
        orderDate: DateTime(2026, 9, 5),
        status: OrderStatus.shipped,
        customerName: 'Biswajit Das',
        customerPhone: '+91 9999999999',
        deliveryAddress: 'Kolkata 700005, India',
        paymentMode: 'Cash on Delivery',
        deliveryPartner: 'Blue Dart',
        trackingId: '82152921325',
        priceBreakup: const OrderPriceBreakup(
          totalMrp: 2280,
          discountedTotalMrp: 2061,
          shippingCharges: 5,
          tax: 410.4,
        ),
        items: const [
          OrderItemModel(
            id: 'item-1',
            name: 'Lalbaba Superior Minikit',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/m3sLbfF3e8oUcP7zmBDHqJF4XWjCdSpFTl0Htmbh.jpg',
            weight: '5 kg',
            mrp: 2280,
            discountedMrp: 2061,
          ),
        ],
        trackingEvents: [
          TrackingEvent(
            title: 'Order Confirmed',
            description: 'Your order has been placed. It will be shipped soon!',
            timestamp: DateTime(2026, 9, 5, 21, 58),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Order Shipped',
            description: 'Your order is on the way',
            timestamp: DateTime(2026, 9, 6, 9, 37),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Reached Hub',
            description: 'Your order has reached the local hub',
            timestamp: DateTime(2026, 9, 6, 11, 8),
            state: TrackingState.current,
          ),
          TrackingEvent(
            title: 'Out for Delivery',
            description: 'Our courier partner will deliver your order soon',
            timestamp: DateTime(2026, 9, 7, 9, 0),
            state: TrackingState.pending,
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042912374591',
        orderDate: DateTime(2026, 4, 29),
        status: OrderStatus.delivered,
        deliveredDate: DateTime(2026, 5, 1),
        onTime: true,
        customerName: 'Ananya Das',
        customerPhone: '+91 98765 43210',
        deliveryAddress: 'Kolkata 700006, India',
        paymentMode: 'Card',
        deliveryPartner: 'Blue Dart',
        trackingId: '71029384756',
        priceBreakup: const OrderPriceBreakup(
          totalMrp: 140,
          discountedTotalMrp: 127.05,
          shippingCharges: 0,
          tax: 25.2,
        ),
        items: const [
          OrderItemModel(
            id: 'item-2',
            name: 'Ratna Basmati',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
            weight: '1 kg',
            mrp: 140,
            discountedMrp: 127.05,
            isGift: true,
          ),
        ],
        trackingEvents: [
          TrackingEvent(
            title: 'Order Confirmed',
            description: 'Your order has been placed. It will be shipped soon!',
            timestamp: DateTime(2026, 4, 29, 23, 13),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Order Shipped',
            description: 'Your order is on the way',
            timestamp: DateTime(2026, 4, 30, 9, 30),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Out for Delivery',
            description: 'Our courier partner is on the way to deliver your order!',
            timestamp: DateTime(2026, 5, 1, 9, 59),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Delivered',
            description: 'Order was handed to the resident',
            timestamp: DateTime(2026, 5, 1, 12, 37),
            state: TrackingState.completed,
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042912350759',
        orderDate: DateTime(2026, 4, 29),
        status: OrderStatus.delivered,
        deliveredDate: DateTime(2026, 5, 2),
        onTime: false,
        customerName: 'Chanchal Das',
        customerPhone: '+91 8974563210',
        deliveryAddress: 'Kolkata 700007, India',
        paymentMode: 'Cash on Delivery',
        deliveryPartner: 'Delhivery',
        trackingId: '90918273645',
        priceBreakup: const OrderPriceBreakup(
          totalMrp: 140,
          discountedTotalMrp: 127.05,
          shippingCharges: 0,
          tax: 25.2,
        ),
        items: const [
          OrderItemModel(
            id: 'item-4',
            name: 'Lalbaba Basmati Steam',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/et6fkpcUKLyLsa8nJq2UB9vEOXvkQQZxEruDttXG.jpg',
            weight: '2 kg',
            mrp: 140,
            discountedMrp: 127.05,
          ),
        ],
        trackingEvents: [
          TrackingEvent(
            title: 'Order Confirmed',
            description: 'Your order has been placed. It will be shipped soon!',
            timestamp: DateTime(2026, 4, 29, 20, 0),
            state: TrackingState.completed,
          ),
          TrackingEvent(
            title: 'Delivered',
            description: 'Order was handed to the resident',
            timestamp: DateTime(2026, 5, 2, 14, 20),
            state: TrackingState.completed,
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042812224376',
        orderDate: DateTime(2026, 4, 28),
        status: OrderStatus.processing,
        customerName: 'Debasish Das',
        customerPhone: '+91 7654321098',
        deliveryAddress: 'Kolkata 700008, India',
        paymentMode: 'UPI',
        priceBreakup: const OrderPriceBreakup(
          totalMrp: 140,
          discountedTotalMrp: 127.05,
          shippingCharges: 0,
          tax: 10.16,
        ),
        items: const [
          OrderItemModel(
            id: 'item-5',
            name: 'Lalbaba Basmati',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/TrNCHY8Q1RIXdFXl3SUgSkL68TG8iQW06IfslmPd.jpg',
            weight: '1 kg',
            mrp: 140,
            discountedMrp: 127.05,
        
          ),
        ],
        trackingEvents: [
          TrackingEvent(
            title: 'Order Confirmed',
            description: 'Your order has been placed. It will be shipped soon!',
            timestamp: DateTime(2026, 4, 28, 18, 45),
            state: TrackingState.current,
          ),
        ],
      ),
    ];
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, AsyncValue<List<OrderModel>>>(
  (ref) => OrdersNotifier(),
);

final orderDetailsProvider = Provider.family<OrderModel?, String>((ref, orderId) {
  final orders = ref.watch(ordersProvider).value;
  if (orders == null) return null;
  for (final order in orders) {
    if (order.orderId == orderId) return order;
  }
  return null;
});
