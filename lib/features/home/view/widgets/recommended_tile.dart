import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';
import 'package:zomato_ui/core/utils/rating_utils.dart';
import 'package:zomato_ui/features/home/models/biryani_model.dart';

class RecommendedTile extends StatelessWidget {
  final Recommended recommended;
  const RecommendedTile({super.key, required this.recommended});

  @override
  Widget build(BuildContext context) {
    final ratingColor = RatingUtils.getRatingColor(
      recommended.rating.toDouble(),
    );
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: CachedNetworkImage(
                  imageUrl: recommended.imageUrl.first,
                  fit: BoxFit.cover,
                  height: 100,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      Container(color: AppColors.background),
                ),
              ),

              // Offer badge
              Positioned(
                left: 0,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    border: const Border(
                      top: BorderSide(
                        color: AppColors.textSecondary,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: AppColors.textSecondary,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: AppColors.textSecondary,
                        width: 1.0,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(4.0),
                      bottomRight: const Radius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    recommended.offer,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        Shadow(
                          offset: Offset(-1.5, -1.5),
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Rating badge
              Positioned(
                bottom: 4,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: ratingColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        recommended.rating.toString(),
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 4.0),

                      Icon(Icons.star, size: 10, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              recommended.title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 15.0,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          const SizedBox(height: 2),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: AppColors.textSecondary,
                  size: 16,
                ),
                const SizedBox(width: 1.0),
                Expanded(
                  child: Text(
                    recommended.deliveryTime,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
