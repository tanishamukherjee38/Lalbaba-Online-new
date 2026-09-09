// My Orders page — Nykaa-style layout, Lalbaba order numbers.
// Riverpod ConsumerWidget: no local state, everything comes from
// ordersProvider. Each card / row is its own widget file under widgets/.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../account/presentation/widgets/app_string.dart';

import '../../model/order_model.dart';
import '../../model/order_provider.dart';

import '../widgets/order_card.dart';
import '../widgets/order_shimmer.dart';


class MyOrdersPage extends ConsumerWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      // Title comes from AppStrings.myOrders — change it there once and
      // this appbar (plus anywhere else that uses the same getter) updates
      // together. Nothing here hardcodes the "My Orders" text.
      appBar: AppAppBar(
        title: AppStrings.myOrders,
        automaticallyImplyLeading: false,
      ),
      body: ordersAsync.when(
        loading: () => const OrderListShimmer(),
        error: (error, stackTrace) => _ErrorState(
          onRetry: () => ref.read(ordersProvider.notifier).loadOrders(),
        ),
        data: (orders) {
          if (orders.isEmpty) {
            return const _EmptyState();
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(ordersProvider.notifier).loadOrders(),
            child: ListView.builder(
              padding: EdgeInsets.all(AppSizes.spacingMedium),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(
                  order: order,
                  onCancel: () => _confirmCancel(context, ref, order),
                  onView: () => _viewOrder(context, order),
                  onItemTap: (item) => _viewItem(context, item),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _confirmCancel(BuildContext context, WidgetRef ref, OrderModel order) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel Order'),
        content: Text('Cancel order ${order.orderId}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ref.read(ordersProvider.notifier).cancelOrder(order.orderId);
            },
            child: Text(
              'Yes, Cancel',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _viewOrder(BuildContext context, OrderModel order) {
    // TODO: navigate to the order-detail page with `order`.
  }

  void _viewItem(BuildContext context, OrderItemModel item) {
    // TODO: navigate to the product-detail page with `item`.
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No orders yet',
        style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Something went wrong',
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: AppSizes.spacingSmall),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
