// BuildContext extensions.
// Why: Provide reusable helper methods related to BuildContext.
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
}
