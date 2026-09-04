import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_fonts.dart';
import '../../app/theme/app_sizes.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  const AppAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryLight,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          height: 1.1,
          letterSpacing: 0.2,
          fontFamily: AppFonts.primary,
        ),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
