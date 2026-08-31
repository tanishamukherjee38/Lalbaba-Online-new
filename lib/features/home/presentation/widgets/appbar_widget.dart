import 'package:flutter/material.dart';

// LalBaba app bar.
// Why: kept as its own PreferredSizeWidget so home_page.dart just does
// `appBar: LalBabaAppBar(...)` and doesn't own any appbar layout logic.
class LalBabaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int cartCount;
  final VoidCallback? onCartTap;

  const LalBabaAppBar({
    super.key,
    this.cartCount = 0,
    this.onCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE23F1C),
      elevation: 0,
      centerTitle: true,
      // Builder is required here so Scaffold.of(context) can find the
      // Scaffold that owns the Drawer (the AppBar itself is a sibling,
      // not a descendant, of that Scaffold's context).
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'LalBaba',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: onCartTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 2,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      constraints:
                          const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Color(0xFFE23F1C),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
