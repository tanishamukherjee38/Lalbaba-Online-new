// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemNavigator, SystemUiOverlayStyle;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kStartUrl = 'https://www.lalbabaonline.com/';
const Color appRed = Color(0xFFf70707);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LalbabaApp());
}

class LalbabaApp extends StatelessWidget {
  const LalbabaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LALBABA ONLINE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

/* ===================== Reusable Full-screen No Internet Modal ===================== */
Future<void> showNoInternetModal({
  required BuildContext context,
  required VoidCallback onRetry,
}) async {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'NoInternet',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.wifi_off_rounded, size: 44, color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No Internet Connection',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Please turn on your internet to continue.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              backgroundColor: appRed,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(ctx, rootNavigator: true).pop();
                              onRetry();
                            },
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Retry', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

/* ===================== Splash Screen ===================== */
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _onlineWatch;
  bool _offlineModalOpen = false; // <-- track modal

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _onlineWatch?.cancel();
    super.dispose();
  }

  Future<bool> _hasInternet() async {
    if (kIsWeb) return true;
    try {
      final result = await io.InternetAddress.lookup('one.one.one.one')
          .timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _startAutoOnlineWatcher() {
    _onlineWatch?.cancel();
    _onlineWatch = Timer.periodic(const Duration(seconds: 2), (Timer t) async {
      final online = await _hasInternet();
      if (online && mounted) {
        t.cancel();
        // auto-close modal if showing
        if (_offlineModalOpen) {
          Navigator.of(context, rootNavigator: true).pop();
          _offlineModalOpen = false;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LalbabaHome()),
        );
      }
    });
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final online = await _hasInternet();
    if (!online) {
      _startAutoOnlineWatcher();
      _offlineModalOpen = true;
      await showNoInternetModal(
        context: context,
        onRetry: _bootstrap,
      );
      _offlineModalOpen = false;
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LalbabaHome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage("lib/assets/logo-icon.png"),
          radius: 75,
        ),
      ),
    );
  }
}

/* ===================== Home (WebView) ===================== */
class LalbabaHome extends StatefulWidget {
  const LalbabaHome({super.key});

  @override
  State<LalbabaHome> createState() => _LalbabaHomeState();
}

class _LalbabaHomeState extends State<LalbabaHome> {
  late final WebViewController _controller;
  Timer? _homeOnlineWatch;
  bool _offlineModalOpen = false;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      _launchInSameTab(Uri.parse(kStartUrl));
      return;
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            final uri = Uri.parse(req.url);
            final isLalbaba = uri.host.contains('lalbabaonline.com');
            if (!isLalbaba) {
              _launchExternally(uri);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onWebResourceError: (error) async {
            _startHomeAutoOnlineWatcher();
            if (!_offlineModalOpen && mounted) {
              _offlineModalOpen = true;
              await showNoInternetModal(
                context: context,
                onRetry: () async {
                  try {
                    await _controller.reload();
                  } catch (_) {
                    await _controller.loadRequest(Uri.parse(kStartUrl));
                  }
                },
              );
              _offlineModalOpen = false;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(kStartUrl));
  }

  @override
  void dispose() {
    _homeOnlineWatch?.cancel();
    super.dispose();
  }

  void _startHomeAutoOnlineWatcher() {
    _homeOnlineWatch?.cancel();
    _homeOnlineWatch = Timer.periodic(const Duration(seconds: 2), (t) async {
      try {
        final result = await io.InternetAddress.lookup('one.one.one.one')
            .timeout(const Duration(seconds: 3));
        final online = result.isNotEmpty && result.first.rawAddress.isNotEmpty;
        if (online) {
          t.cancel();
          if (!mounted) return;

          // auto-close modal if showing
          if (_offlineModalOpen) {
            Navigator.of(context, rootNavigator: true).pop();
            _offlineModalOpen = false;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Back online — reloading…')),
          );
          try {
            await _controller.reload();
          } catch (_) {
            await _controller.loadRequest(Uri.parse(kStartUrl));
          }
        }
      } catch (_) {
        // still offline; keep waiting
      }
    });
  }

  Future<void> _launchExternally(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open link')),
        );
      }
    }
  }

  void _launchInSameTab(Uri uri) {
    launchUrl(uri, webOnlyWindowName: '_self');
  }

  Future<void> _exitApp() async {
    if (kIsWeb) return;
    if (io.Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      io.exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: appRed,
        statusBarIconBrightness: Brightness.light,
      ),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) return;

          if (_offlineModalOpen) return;

          if (await _controller.canGoBack()) {
            await _controller.goBack();
          } else {
            if (!mounted) return;
            final shouldExit = await showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) => AlertDialog(
                    contentTextStyle:
                        const TextStyle(fontSize: 17, color: Colors.black),
                    content: const Text('Do you want to exit?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                ) ??
                false;

            if (shouldExit) {
              await _exitApp();
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appRed,
            elevation: 0,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 0,
          ),
          body: RefreshIndicator(
            onRefresh: () => _controller.reload(),
            child: WebViewWidget(controller: _controller),
          ),
        ),
      ),
    );
  }
}
