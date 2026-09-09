// Riverpod state for the My Orders page.
// Why: Keeps loading / cancel / refresh logic out of the widget tree.
//
// Usage in a ConsumerWidget:
//   final ordersAsync = ref.watch(ordersProvider);
//   ordersAsync.when(loading: ..., error: ..., data: ...);
//
//   ref.read(ordersProvider.notifier).cancelOrder(order.orderId);
//   ref.read(ordersProvider.notifier).loadOrders(); // pull-to-refresh

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lalbaba_online/features/order/model/order_model.dart';



class OrdersNotifier extends StateNotifier<AsyncValue<List<OrderModel>>> {
  OrdersNotifier() : super(const AsyncValue.loading()) {
    loadOrders();
  }

  Future<void> loadOrders() async {
    state = const AsyncValue.loading();
    try {
      // TODO: replace with the real API/repository call.
      await Future.delayed(const Duration(milliseconds: 1200));
      state = AsyncValue.data(_mockOrders());
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    final current = state.value;
    if (current == null) return;

    // Optimistic update — swap for an API call + rollback on failure later.
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
        status: OrderStatus.processing,
        amount: 2066.00,
        items: const [
          OrderItemModel(
            id: 'item-1',
            name: 'Lalbaba Superior Minikit',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/m3sLbfF3e8oUcP7zmBDHqJF4XWjCdSpFTl0Htmbh.jpg',
            weight: '5 kg',
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042912374591',
        orderDate: DateTime(2026, 4, 29),
        status: OrderStatus.delivered,
        deliveredDate: DateTime(2026, 5, 1),
        onTime: true,
        amount: 127.05,
        items: const [
          OrderItemModel(
            id: 'item-2',
            name: 'Ratna Basmati',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/jfCxsG3mPdSQSo4clKBd2dFNqTFr4af2fEZx2wkW.webp',
            weight: '1 kg',
            isGift: true,
          ),
          OrderItemModel(
            id: 'item-3',
            name: 'Lalbaba Jeer Rice',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/RELpVSRhk9O2YI4mFP18hzuRxzobrGGsTBSd9Jq9.jpg',
            weight: '1 kg',
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042912350759',
        orderDate: DateTime(2026, 4, 29),
        status: OrderStatus.delivered,
        deliveredDate: DateTime(2026, 5, 2),
        onTime: false,
        amount: 127.05,
        items: const [
          OrderItemModel(
            id: 'item-4',
            name: 'Lalbaba Basmati Steam',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/et6fkpcUKLyLsa8nJq2UB9vEOXvkQQZxEruDttXG.jpg',
            weight: '2 kg',
          ),
        ],
      ),
      OrderModel(
        orderId: 'LB23042812224376',
        orderDate: DateTime(2026, 4, 28),
        status: OrderStatus.shipped,
        amount: 127.05,
        items: const [
          OrderItemModel(
            id: 'item-5',
            name: 'Lalbaba Basmati',
            imageUrl:
                'https://lalbabaonline.com/public/uploads/all/TrNCHY8Q1RIXdFXl3SUgSkL68TG8iQW06IfslmPd.jpg',
            weight: '1 kg',
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
