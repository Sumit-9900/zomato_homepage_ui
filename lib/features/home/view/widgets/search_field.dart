import 'package:flutter/material.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Restaurant name or a dish...',
        prefixIcon: Icon(
          Icons.search,
          size: 26,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: Icon(Icons.mic_none_outlined, color: AppColors.textPrimary),
      ),
    );
  }
}
