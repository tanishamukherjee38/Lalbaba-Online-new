// Order details page. Why: Display detailed information for a selected order.
// Orders page. Why: Display the user's order list.
import 'package:flutter/material.dart';

/// ================================================================
/// AppColors - your existing theme file (kept as-is, included here
/// only so this file compiles standalone). Replace with your import:
/// import 'app_colors.dart';
/// ================================================================
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFF70707);
  static const Color primaryDark = Color(0xFFD60000);
  static const Color primaryLight = Color(0xFFFFE8E8);

  static const Color secondary = Color(0xFF2E7D32);
  static const Color secondaryLight = Color(0xFFE8F5E9);

  static const Color accent = Color(0xFFF9A825);

  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF9A825);
  static const Color info = Color(0xFF1976D2);

  static const Color disabled = Color(0xFFBDBDBD);
  static const Color disabledBackground = Color(0xFFEEEEEE);

  static const Color grey = Color(0xFF9E9E9E);
  static const Color buttoncolor = Color(0xFFE62E04);
}

/// ================================================================
/// Simple text style helper (swap for your real AppTextStyles import)
/// ================================================================
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 13.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyStrong = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}

/// ================================================================
/// ORDER DETAILS PAGE
/// ================================================================
class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    super.key,
    this.orderId = '326782951487868480',
    this.productTitle = 'Lalbaba Superior Minikit',
    this.size = '5 Kg',
    this.isPrepaid = true,
    this.deliveryDate = 'Wed, 09 Sep',
    this.currentLocationLabel = 'Hub Location',
  });

  final String orderId;
  final String productTitle;
  final String size;
  final bool isPrepaid;
  final String deliveryDate;
  final String currentLocationLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderCard(),
            _sectionGap(),
            _buildDeliveryStatusCard(),
            _buildInfoRow(
              text: 'Order shipped, cancel unavailable.',
              actionLabel: 'KNOW MORE',
              onTap: () {},
            ),
            _sectionGap(),
            _buildDeliveryAddressCard(),
            _buildInfoRow(
              text: 'Address change unavailable!',
              actionLabel: 'KNOW MORE',
              onTap: () {},
            ),
            _sectionGap(),
            _buildRecentlyViewed(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // APP BAR
  // ------------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0.5,
      surfaceTintColor: AppColors.surface,
      leading: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
      titleSpacing: 0,
      title: const Text('ORDER DETAILS', style: AppTextStyles.appBarTitle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: const [
              Icon(Icons.support_agent_rounded, color: AppColors.primary, size: 22),
              SizedBox(width: 4),
              Text(
                'HELP',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // PRODUCT / ORDER CARD
  // ------------------------------------------------------------
  Widget _buildOrderCard() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder icon box - replace with Image.network(...) later
          Container(
            width: 64,
            height: 78,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.checkroom_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order #$orderId', style: AppTextStyles.bodyStrong),
                const SizedBox(height: 4),
                Text(
                  productTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 4),
                Text(
                  '$size • ${isPrepaid ? "Prepaid" : "COD"}',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 4),
               
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textHint),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // DELIVERY STATUS / TRACKING CARD
  // ------------------------------------------------------------
  Widget _buildDeliveryStatusCard() {
    // status: 0 = done, 1 = current, 2 = pending
    final steps = <_TrackStep>[
      const _TrackStep(label: 'Ordered', date: '02 Sep', status: _StepStatus.done),
      const _TrackStep(label: 'Shipped', date: '03 Sep', status: _StepStatus.done),
      const _TrackStep(label: 'Out for Delivery', date: '09 Sep', status: _StepStatus.current),
      const _TrackStep(label: 'Delivery', date: '09 Sep', status: _StepStatus.pending),
    ];

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.local_shipping_rounded, color: AppColors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('On the way', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 2),
                  Text('Delivery by $deliveryDate', style: AppTextStyles.body),
                ],
              ),
            ],
          ),
          const SizedBox(height: 28),
          // Current-location tooltip bubble
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionalTranslation(
                translation: const Offset(0.28, 0),
                child: _buildLocationBubble(),
              ),
            ),
          ),
          const SizedBox(height: 4),
          _buildTimelineTrack(steps),
          const SizedBox(height: 8),
          _buildTimelineLabels(steps),
        ],
      ),
    );
  }

  Widget _buildLocationBubble() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                currentLocationLabel,
                style: const TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: const [
              SizedBox(width: 16),
              Text(
                'View Details',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12.5,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(width: 2),
              Icon(Icons.chevron_right, color: AppColors.white, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTrack(List<_TrackStep> steps) {
    List<Widget> children = [];
    for (int i = 0; i < steps.length; i++) {
      children.add(_buildStepDot(steps[i].status));
      if (i != steps.length - 1) {
        final bool lineActive = steps[i].status == _StepStatus.done;
        children.add(
          Expanded(
            child: Container(
              height: 3,
              color: lineActive ? AppColors.secondary : AppColors.border,
            ),
          ),
        );
      }
    }
    return Row(children: children);
  }

  Widget _buildStepDot(_StepStatus status) {
    switch (status) {
      case _StepStatus.done:
        return Container(
          width: 26,
          height: 26,
          decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
          child: const Icon(Icons.check, color: AppColors.white, size: 16),
        );
      case _StepStatus.current:
        return Container(
          width: 26,
          height: 26,
          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          child: const Icon(Icons.local_shipping, color: AppColors.white, size: 14),
        );
      case _StepStatus.pending:
        return Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(color: AppColors.disabledBackground, shape: BoxShape.circle),
          child: const Icon(Icons.check, color: AppColors.disabled, size: 16),
        );
    }
  }

  Widget _buildTimelineLabels(List<_TrackStep> steps) {
    return Row(
      children: steps.map((s) {
        final bool isPending = s.status == _StepStatus.pending;
        return Expanded(
          child: Column(
            children: [
              Text(
                s.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: isPending ? AppColors.textHint : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                s.date,
                style: TextStyle(
                  fontSize: 12,
                  color: isPending ? AppColors.textHint : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ------------------------------------------------------------
  // GENERIC INFO ROW (cancel unavailable / address change unavailable)
  // ------------------------------------------------------------
  Widget _buildInfoRow({
    required String text,
    required String actionLabel,
    required VoidCallback onTap,
  }) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(text, style: AppTextStyles.body),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionLabel,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // DELIVERY ADDRESS CARD (placeholder only — no real name/address)
  // ------------------------------------------------------------
  Widget _buildDeliveryAddressCard() {
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: AppColors.primary, size: 20),
              SizedBox(width: 8),
              Text('Delivery Address', style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Recipient Name', style: AppTextStyles.bodyStrong),
          const SizedBox(height: 4),
          const Text(
            'Address line will appear here once added.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 4),
          const Text('Phone number', style: AppTextStyles.body),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // RECENTLY VIEWED
  // ------------------------------------------------------------
  Widget _buildRecentlyViewed() {
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Recently Viewed', style: AppTextStyles.sectionTitle),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  // Placeholder icon - replace with Image.network(...) later
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppColors.textHint,
                    size: 32,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionGap() => const SizedBox(height: 8);
}

enum _StepStatus { done, current, pending }

class _TrackStep {
  final String label;
  final String date;
  final _StepStatus status;

  const _TrackStep({required this.label, required this.date, required this.status});
}