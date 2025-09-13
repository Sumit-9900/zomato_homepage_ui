import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/core/constants/app_constants.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';
import 'package:zomato_ui/core/utils/rating_utils.dart';
import 'package:zomato_ui/features/home/models/biryani_model.dart';

class AllRestaurantTile extends StatelessWidget {
  final Recommended allRestaurant;
  const AllRestaurantTile({super.key, required this.allRestaurant});

  @override
  Widget build(BuildContext context) {
    final ratingColor = RatingUtils.getRatingColor(
      allRestaurant.rating.toDouble(),
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- IMAGE + OVERLAYS ----------------
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14.0),
                  topRight: Radius.circular(14.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: allRestaurant.imageUrl.first,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      Container(color: AppColors.background),
                ),
              ),
              // Special Order
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    allRestaurant.specialOrder,
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
              // Ad + Bookmark
              Positioned(
                right: 15,
                top: 15,
                child: Row(
                  children: [
                    if (allRestaurant.isAd)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          "Ad",
                          style: TextStyle(
                            color: AppColors.textSecondary.withOpacity(0.7),
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: AppColors.textPrimary,
                      size: 26,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ---------------- RESTAURANT DETAILS ----------------
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      allRestaurant.title,
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Rating
                    Column(
                      children: [
                        Container(
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
                                allRestaurant.rating.toString(),
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4.0),

                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: AppColors.textPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.star,
                                  size: 14,
                                  color: ratingColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'For you',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Delivery time + Distance
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                    const SizedBox(width: 1.0),
                    Text(
                      allRestaurant.deliveryTime,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 12,
                      width: 1,
                      color: Colors.grey.shade700,
                    ),
                    Text(
                      allRestaurant.distanceFromHere,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Offer
                Row(
                  children: [
                    Image.asset(AppConstants.discountOfferImage, width: 16),
                    SizedBox(width: 4),
                    Text(
                      allRestaurant.offer,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
