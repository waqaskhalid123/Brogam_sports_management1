import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class CustomDropdownField extends StatelessWidget {
  final String? value;
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownField({super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lighyGreyColor1),
        color: AppColors.textFiledColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(hintText),
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}