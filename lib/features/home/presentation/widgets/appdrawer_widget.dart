// // import 'package:flutter/material.dart';

// // import '../../../../core/constants/asset_constants.dart';

// // // Side drawer opened by the appbar hamburger icon.
// // // Why: kept separate from appbar_widget.dart because a Drawer must be
// // // passed to Scaffold's `drawer:` slot, not built inside the AppBar itself.
// // class AppDrawerWidget extends StatelessWidget {
// //   final VoidCallback? onAboutUsTap;
// //   final VoidCallback? onSupportPolicyTap;
// //   final VoidCallback? onTermsOfUsTap;

// //   const AppDrawerWidget({
// //     super.key,
// //     this.onAboutUsTap,
// //     this.onSupportPolicyTap,
// //     this.onTermsOfUsTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               width: double.infinity,
// //               padding: const EdgeInsets.all(20),
// //               color: const Color(0xFFE23F1C),
// //               child: Row(
// //                 children: [
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(6),
// //                     child: Image.asset(
// //                       AssetConstants.logo,
// //                       width: 36,
// //                       height: 36,
// //                       fit: BoxFit.contain,
// //                       errorBuilder: (context, error, stackTrace) =>
// //                           const Icon(Icons.rice_bowl, color: Colors.white),
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   const Text(
// //                     'LalBaba',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.info_outline),
// //               title: const Text('About Us'),
// //               onTap: onAboutUsTap,
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.support_agent_outlined),
// //               title: const Text('Support Policy'),
// //               onTap: onSupportPolicyTap,
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.description_outlined),
// //               title: const Text('Terms of Us'),
// //               onTap: onTermsOfUsTap,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import '../../../../app/theme/app_colors.dart';
// import '../../../../core/constants/asset_constants.dart';

// // Side drawer opened by the appbar hamburger icon — Flipkart blue header.
// class AppDrawerWidget extends StatelessWidget {
//   final VoidCallback? onAboutUsTap;
//   final VoidCallback? onSupportPolicyTap;
//   final VoidCallback? onTermsOfUsTap;

//   const AppDrawerWidget({
//     super.key,
//     this.onAboutUsTap,
//     this.onSupportPolicyTap,
//     this.onTermsOfUsTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               color: AppColors.error,
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(6),
//                     child: Image.asset(
//                       AssetConstants.logo,
//                       width: 36,
//                       height: 36,
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) =>
//                           const Icon(Icons.rice_bowl, color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   const Text(
//                     'LalBaba',
//                     style: TextStyle(
//                       color: AppColors.background,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.info_outline, color: Color(0xFFE23F1C)),
//               title: const Text('About Us'),
//               onTap: onAboutUsTap,
//             ),
//             ListTile(
//               leading: const Icon(Icons.support_agent_outlined,
//                   color: AppColors.error),
//               title: const Text('Support Policy'),
//               onTap: onSupportPolicyTap,
//             ),
//             ListTile(
//               leading: const Icon(Icons.description_outlined,
//                   color: AppColors.error),
//               title: const Text('Terms of Us'),
//               onTap: onTermsOfUsTap,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';

/// App language options for the toggle on this page.
enum AppLanguage { english, bengali }

/// Full-page Account screen (converted from the old drawer).
/// Matches the reference design: avatar header with name/email,
/// rounded list items with icon + label + chevron, and a
/// pill-shaped Log Out button at the bottom.
class AccountPage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String? avatarUrl;

  final AppLanguage initialLanguage;
  final ValueChanged<AppLanguage>? onLanguageChanged;

  final VoidCallback? onEditProfileTap;
  final VoidCallback? onAboutUsTap;
  final VoidCallback? onSupportPolicyTap;
  final VoidCallback? onTermsOfUseTap;
  final VoidCallback? onTrackOrdersTap;
  final VoidCallback? onWishlistTap;
  final VoidCallback? onShippingPolicyTap;
  final VoidCallback? onReturnsRefundTap;
  final VoidCallback? onPrivacyPolicyTap;
  final VoidCallback? onFactoryLocatorTap;
  final VoidCallback? onLogoutTap;

  const AccountPage({
    super.key,
    required this.userName,
    required this.userEmail,
    this.avatarUrl,
    this.initialLanguage = AppLanguage.english,
    this.onLanguageChanged,
    this.onEditProfileTap,
    this.onAboutUsTap,
    this.onSupportPolicyTap,
    this.onTermsOfUseTap,
    this.onTrackOrdersTap,
    this.onWishlistTap,
    this.onShippingPolicyTap,
    this.onReturnsRefundTap,
    this.onPrivacyPolicyTap,
    this.onFactoryLocatorTap,
    this.onLogoutTap,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late AppLanguage _language;

  @override
  void initState() {
    super.initState();
    _language = widget.initialLanguage;
  }

  void _setLanguage(AppLanguage lang) {
    if (_language == lang) return;
    setState(() => _language = lang);
    widget.onLanguageChanged?.call(lang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            _ProfileHeader(
              name: widget.userName,
              email: widget.userEmail,
              avatarUrl: widget.avatarUrl,
              onEditTap: widget.onEditProfileTap,
            ),
            const SizedBox(height: 20),
            _LanguageSwitcherTile(
              selected: _language,
              onChanged: _setLanguage,
            ),
            const SizedBox(height: 8),
            _MenuTile(
              icon: Icons.info_outline,
              label: _t('About Us', 'আমাদের সম্পর্কে'),
              onTap: widget.onAboutUsTap,
            ),
            _MenuTile(
              icon: Icons.support_agent_outlined,
              label: _t('Support Policy', 'সাপোর্ট পলিসি'),
              onTap: widget.onSupportPolicyTap,
            ),
            _MenuTile(
              icon: Icons.description_outlined,
              label: _t('Terms of Use', 'ব্যবহারের শর্তাবলী'),
              onTap: widget.onTermsOfUseTap,
            ),
            _MenuTile(
              icon: Icons.local_shipping_outlined,
              label: _t('Track Orders', 'অর্ডার ট্র্যাক করুন'),
              onTap: widget.onTrackOrdersTap,
            ),
            _MenuTile(
              icon: Icons.favorite_border,
              label: _t('Wishlist', 'উইশলিস্ট'),
              onTap: widget.onWishlistTap,
            ),
            _MenuTile(
              icon: Icons.inventory_2_outlined,
              label: _t('Shipping Policy', 'শিপিং পলিসি'),
              onTap: widget.onShippingPolicyTap,
            ),
            _MenuTile(
              icon: Icons.replay_outlined,
              label: _t('Returns and Refund', 'রিটার্ন ও রিফান্ড'),
              onTap: widget.onReturnsRefundTap,
            ),
            _MenuTile(
              icon: Icons.privacy_tip_outlined,
              label: _t('Privacy Policy', 'প্রাইভেসি পলিসি'),
              onTap: widget.onPrivacyPolicyTap,
            ),
            _MenuTile(
              icon: Icons.factory_outlined,
              label: _t('Factory Locator', 'ফ্যাক্টরি লোকেটর'),
              onTap: widget.onFactoryLocatorTap,
            ),
            const SizedBox(height: 24),
            _LogoutButton(
              label: _t('Log Out', 'লগ আউট'),
              onTap: widget.onLogoutTap,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _t(String en, String bn) => _language == AppLanguage.english ? en : bn;
}

// ---------------------------------------------------------------------------
// Profile header: avatar + name + edit icon + email
// ---------------------------------------------------------------------------
class _ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? avatarUrl;
  final VoidCallback? onEditTap;

  const _ProfileHeader({
    required this.name,
    required this.email,
    this.avatarUrl,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF7FD7C4), Color(0xFFE9A0BE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(2),
          child: ClipOval(
            child: (avatarUrl != null && avatarUrl!.isNotEmpty)
                ? Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _fallbackAvatar(),
                  )
                : _fallbackAvatar(),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: onEditTap,
                    child: const Icon(Icons.edit, size: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                email,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _fallbackAvatar() => Container(
        color: Colors.white,
        child: const Icon(Icons.person, color: Colors.grey, size: 28),
      );
}

// ---------------------------------------------------------------------------
// Language switcher row (English / Bengali)
// ---------------------------------------------------------------------------
class _LanguageSwitcherTile extends StatelessWidget {
  final AppLanguage selected;
  final ValueChanged<AppLanguage> onChanged;

  const _LanguageSwitcherTile({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.language, size: 20, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Language',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          _LangChip(
            label: 'EN',
            active: selected == AppLanguage.english,
            onTap: () => onChanged(AppLanguage.english),
          ),
          const SizedBox(width: 6),
          _LangChip(
            label: 'বাং',
            active: selected == AppLanguage.bengali,
            onTap: () => onChanged(AppLanguage.bengali),
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _LangChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.error : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Single menu row: square icon box + label + chevron
// ---------------------------------------------------------------------------
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MenuTile({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: Colors.black87),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
            const Icon(Icons.chevron_right, size: 22, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pill shaped Log Out button
// ---------------------------------------------------------------------------
class _LogoutButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _LogoutButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 18, color: AppColors.error),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
