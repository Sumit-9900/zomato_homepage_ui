import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_ui/core/constants/app_constants.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';
import 'package:zomato_ui/core/utils/rating_utils.dart';
import 'package:zomato_ui/features/home/models/biryani_model.dart';

class FoodDetailsPage extends StatelessWidget {
  final Recommended restaurant;

  const FoodDetailsPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final ratingColor = RatingUtils.getRatingColor(
      restaurant.rating.toDouble(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.surface,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- IMAGE HEADER --------
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: restaurant.imageUrl.first,
                  fit: BoxFit.cover,
                  height: 240,
                  width: double.infinity,
                  errorWidget: (context, url, error) =>
                      Container(color: AppColors.background),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ratingColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          restaurant.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, size: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // -------- DETAILS SECTION --------
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    restaurant.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Delivery time + Distance
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 18,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.deliveryTime,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 14,
                        width: 1,
                        color: Colors.grey.shade600,
                      ),
                      Text(
                        restaurant.distanceFromHere,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Offer
                  Row(
                    children: [
                      Image.asset(AppConstants.discountOfferImage, width: 20),
                      const SizedBox(width: 6),
                      Text(
                        restaurant.offer,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // About Section
                  const Text(
                    "About",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Delicious food prepared with authentic spices and flavors.",
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
