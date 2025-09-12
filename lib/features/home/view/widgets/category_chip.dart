import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';
import 'package:zomato_ui/features/home/models/category.dart';

class CategoryChip extends StatelessWidget {
  final Category filterCategory;
  const CategoryChip({super.key, required this.filterCategory});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        radius: 23,
        backgroundColor: AppColors.surface,
        backgroundImage: CachedNetworkImageProvider(
          filterCategory.imagePath,
          errorListener: (_) => Container(color: AppColors.surface),
        ),
      ),
      label: Text(filterCategory.title),
    );
  }
}
