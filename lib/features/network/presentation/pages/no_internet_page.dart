// No internet screen.
// Why: Inform the user when the device has no active internet connection.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_names.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Internet unavailable icon.
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.wifi_off_rounded,
                    size: 56,
                    color: theme.colorScheme.error,
                  ),
                ),

                const SizedBox(height: 28),

                // Title.
                Text(
                  'No Internet Connection',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // Description.
                Text(
                  'Please check your internet connection '
                  'and try again.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 32),

                // Retry button.
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.go(RouteNames.splash);
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Try Again'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
