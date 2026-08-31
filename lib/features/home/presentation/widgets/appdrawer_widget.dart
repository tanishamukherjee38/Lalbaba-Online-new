import 'package:flutter/material.dart';

import '../../../../core/constants/asset_constants.dart';

// Side drawer opened by the appbar hamburger icon.
// Why: kept separate from appbar_widget.dart because a Drawer must be
// passed to Scaffold's `drawer:` slot, not built inside the AppBar itself.
class AppDrawerWidget extends StatelessWidget {
  final VoidCallback? onAboutUsTap;
  final VoidCallback? onSupportPolicyTap;
  final VoidCallback? onTermsOfUsTap;

  const AppDrawerWidget({
    super.key,
    this.onAboutUsTap,
    this.onSupportPolicyTap,
    this.onTermsOfUsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFE23F1C),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.rice_bowl, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'LalBaba',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: onAboutUsTap,
            ),
            ListTile(
              leading: const Icon(Icons.support_agent_outlined),
              title: const Text('Support Policy'),
              onTap: onSupportPolicyTap,
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('Terms of Us'),
              onTap: onTermsOfUsTap,
            ),
          ],
        ),
      ),
    );
  }
}
