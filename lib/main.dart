// PURPOSE:
// Application entry point.
// Use this file to initialize Flutter and start the application.
// Keep app-wide startup logic here, not feature-specific business logic.

import 'package:flutter/material.dart';
import 'package:lalbaba_online/webView/lalbabaWebView.dart';

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
