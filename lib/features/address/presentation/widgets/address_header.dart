import 'package:flutter/material.dart';

import '../../../account/presentation/widgets/app_string.dart';

class AddressTypeSelector extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const AddressTypeSelector({required this.value, required this.onChanged});

  @override
  State<AddressTypeSelector> createState() => _AddressTypeSelectorState();
}

class _AddressTypeSelectorState extends State<AddressTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _typeItem(icon: Icons.home_outlined, title: AppStrings.home),
        const SizedBox(width: 10),
        _typeItem(icon: Icons.work_outline_rounded, title: AppStrings.office),
        const SizedBox(width: 10),
        _typeItem(icon: Icons.location_on_outlined, title: AppStrings.other),
      ],
    );
  }

  Widget _typeItem({required IconData icon, required String title}) {
    final selected = widget.value == title;

    return Expanded(
      child: InkWell(
        onTap: () => widget.onChanged(title),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFF1F1) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? const Color(0xFFE50914)
                  : const Color(0xFFE0E0E0),
            ),
          ),
          child: Column(
            children: [
              // Icon(
              //   icon,
              //   size: 21,
              //   color: selected
              //       ? const Color(0xFFE50914)
              //       : const Color(0xFF777777),
              // ),
              // const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? const Color(0xFFE50914)
                      : const Color(0xFF555555),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
