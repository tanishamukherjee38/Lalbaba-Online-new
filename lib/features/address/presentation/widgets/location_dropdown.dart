import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/location_model.dart';

class LocationDropdown extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final String? value;
  final List<LocationItem> items;
  final bool loading;
  final bool enabled;
  final ValueChanged<String?> onChanged;

  const LocationDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.loading = false,
    this.enabled = true,
  });

  Future<void> _openPicker(BuildContext context) async {
    if (!enabled || loading || items.isEmpty) {
      return;
    }

    final LocationItem? selected = await showModalBottomSheet<LocationItem>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _LocationPickerSheet(
          label: label,
          icon: icon,
          items: items,
          selectedValue: value,
        );
      },
    );

    if (selected != null) {
      onChanged(selected.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasValue = value != null && value!.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 7.h),

          InkWell(
            onTap: enabled && !loading ? () => _openPicker(context) : null,
            borderRadius: BorderRadius.circular(12.r),
            child: InputDecorator(
              decoration: InputDecoration(
                prefixIcon: Icon(icon),

                suffixIcon: loading
                    ? Padding(
                        padding: EdgeInsets.all(14.w),
                        child: SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: enabled ? null : Colors.grey,
                      ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),

                enabled: enabled,
              ),

              child: Text(
                hasValue ? value! : hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: hasValue ? null : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// LOCATION PICKER SHEET
// ============================================================

class _LocationPickerSheet extends StatefulWidget {
  final String label;
  final IconData icon;
  final List<LocationItem> items;
  final String? selectedValue;

  const _LocationPickerSheet({
    required this.label,
    required this.icon,
    required this.items,
    required this.selectedValue,
  });

  @override
  State<_LocationPickerSheet> createState() => _LocationPickerSheetState();
}

class _LocationPickerSheetState extends State<_LocationPickerSheet> {
  late final TextEditingController searchController;

  late List<LocationItem> filteredItems;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();

    filteredItems = List<LocationItem>.from(widget.items);
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  // ==========================================================
  // SEARCH
  // ==========================================================

  void _search(String value) {
    final query = value.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredItems = List<LocationItem>.from(widget.items);
      } else {
        filteredItems = widget.items
            .where((item) => item.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  // ==========================================================
  // CLEAR SEARCH
  // ==========================================================

  void _clearSearch() {
    searchController.clear();

    _search('');
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,

        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,

          borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
        ),

        child: SafeArea(
          child: Column(
            children: [
              // =================================================
              // HANDLE
              // =================================================
              SizedBox(height: 12.h),

              Container(
                width: 45.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              SizedBox(height: 18.h),

              // =================================================
              // TITLE
              // =================================================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Icon(widget.icon),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: Text(
                        'Select ${widget.label}',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8.h),

              // =================================================
              // SEARCH
              // =================================================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  controller: searchController,
                  autofocus: false,
                  onChanged: _search,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search ${widget.label}',

                    prefixIcon: const Icon(Icons.search),

                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: _clearSearch,
                            icon: const Icon(Icons.clear),
                          )
                        : null,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              // =================================================
              // RESULT COUNT
              // =================================================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${filteredItems.length} ${widget.label.toLowerCase()} found',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 6.h),

              // =================================================
              // LIST
              // =================================================
              Expanded(
                child: filteredItems.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.only(bottom: 16.h),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];

                          final bool isSelected =
                              item.name.trim().toLowerCase() ==
                              widget.selectedValue?.trim().toLowerCase();

                          return Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                widget.icon,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),

                              title: Text(
                                item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              trailing: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    )
                                  : null,

                              selected: isSelected,

                              onTap: () {
                                Navigator.pop(context, item);
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // EMPTY
  // ==========================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, size: 42.sp, color: Colors.grey),

            SizedBox(height: 10.h),

            Text(
              'No ${widget.label.toLowerCase()} found',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
            ),

            SizedBox(height: 6.h),

            Text(
              'Try another search',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
