// Application update screen.
// Why: Inform the user that a newer version of the application is available.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key, this.isForceUpdate = false});

  final bool isForceUpdate;

  static const String _playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.example.lalbaba';

  Future<void> _openPlayStore() async {
    final uri = Uri.parse(_playStoreUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: !isForceUpdate,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Update icon.
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.system_update_rounded,
                      size: 56,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Title.
                  Text(
                    'Update Available',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Description.
                  Text(
                    'A newer version of Lalbaba Online is available. '
                    'Please update the app to enjoy the latest features '
                    'and improvements.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Update button.
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _openPlayStore,
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Update Now'),
                    ),
                  ),

                  // Optional later button.
                  if (!isForceUpdate) ...[
                    const SizedBox(height: 12),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Maybe Later'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
