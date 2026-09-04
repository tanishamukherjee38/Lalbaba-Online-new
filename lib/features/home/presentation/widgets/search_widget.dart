// import 'package:flutter/material.dart';

// // Home search bar.
// // Why: separated so it can later be reused on category/search-result
// // pages without dragging home_page.dart along with it.
// class SearchWidget extends StatelessWidget {
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onTap;
//   final String hintText;

//   const SearchWidget({
//     super.key,
//     this.controller,
//     this.onChanged,
//     this.onTap,
//     this.hintText = 'Search for rice, masala...',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         height: 44,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade400),
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: TextField(
//           controller: controller,
//           onChanged: onChanged,
//           onTap: onTap,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
//             prefixIcon: const Icon(Icons.search, color: Colors.grey),
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.symmetric(vertical: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class SearchWidget extends StatelessWidget {
//   final TextEditingController? controller;
//   final ValueChanged<String>? onChanged;
//   final VoidCallback? onTap;
//   final String hintText;

//   const SearchWidget({
//     super.key,
//     this.controller,
//     this.onChanged,
//     this.onTap,
//     this.hintText = 'Search for rice, spices...',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         height: 44,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: const Color(0xFFE0E0E0)),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: TextField(
//           controller: controller,
//           onChanged: onChanged,
//           onTap: onTap,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF878787)),
//             prefixIcon: const Icon(Icons.search, color: Color(0xFF878787)),
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.symmetric(vertical: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;


  final List<String> searchHints;

  const SearchWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.searchHints = const [
      'Search for Rice',
      'Search for Spices',
    ],
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController _controller;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    // Only used to rebuild for the clear-button / hint visibility.
    setState(() {});
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final bool showRotatingHint =
        _controller.text.isEmpty && widget.searchHints.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFE6E6E6),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),

            // ─────────────────────────
            // LOGO (embedded in the bar)
            // ─────────────────────────
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                AssetConstants.logo,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.rice_bowl_rounded,
                    color: AppColors.error,
                    size: 20,
                  );
                },
              ),
            ),

            const SizedBox(width: 8),

            Container(
              width: 1,
              height: 20,
              color: const Color(0xFFE6E6E6),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.search_rounded,
              color: Color(0xFF9A9A9A),
              size: 22,
            ),

            const SizedBox(width: 6),

            // ─────────────────────────
            // TEXT FIELD + ROTATING HINT
            // ─────────────────────────
            Expanded(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  if (showRotatingHint)
                    IgnorePointer(
                      child: _VerticalRotatingHint(
                        hints: widget.searchHints,
                      ),
                    ),
                  TextField(
                    controller: _controller,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                    ),
                  ),
                ],
              ),
            ),

            // ─────────────────────────
            // CLEAR BUTTON (only while typing)
            // ─────────────────────────
            if (_controller.text.isNotEmpty)
              IconButton(
                splashRadius: 18,
                icon: const Icon(
                  Icons.close_rounded,
                  color: Color(0xFF9A9A9A),
                  size: 18,
                ),
                onPressed: _clearText,
              )
            else
              const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _VerticalRotatingHint extends StatefulWidget {
  final List<String> hints;

  const _VerticalRotatingHint({required this.hints});

  @override
  State<_VerticalRotatingHint> createState() => _VerticalRotatingHintState();
}

class _VerticalRotatingHintState extends State<_VerticalRotatingHint>
    with SingleTickerProviderStateMixin {
  static const double _lineHeight = 18;
  static const TextStyle _hintStyle = TextStyle(
    fontSize: 14,
    color: Color(0xFF9A9A9A),
  );

  late final AnimationController _controller;
  Timer? _timer;
  int _currentIndex = 0;
  int _nextIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    if (widget.hints.length > 1) {
      _nextIndex = 1;
      _timer = Timer.periodic(const Duration(seconds: 2), (_) => _rotate());
    }
  }

  Future<void> _rotate() async {
    if (!mounted) return;
    await _controller.forward(from: 0);
    if (!mounted) return;
    setState(() {
      _currentIndex = _nextIndex;
      _nextIndex = (_nextIndex + 1) % widget.hints.length;
    });
    _controller.value = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hints.isEmpty) return const SizedBox.shrink();

    return ClipRect(
      child: SizedBox(
        height: _lineHeight,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final double t = _controller.value; // 0 -> 1 each cycle
            return Stack(
              children: [
                // Current hint: slides up and fades out.
                Positioned(
                  top: -t * _lineHeight,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 1 - t,
                    child: Text(
                      widget.hints[_currentIndex],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: _hintStyle,
                    ),
                  ),
                ),
                // Next hint: enters from below, sliding up into place.
                if (widget.hints.length > 1)
                  Positioned(
                    top: _lineHeight - t * _lineHeight,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: t,
                      child: Text(
                        widget.hints[_nextIndex],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: _hintStyle,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
