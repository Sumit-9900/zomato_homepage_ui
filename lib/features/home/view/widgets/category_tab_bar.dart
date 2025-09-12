import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_ui/core/theme/app_colors.dart';
import 'package:zomato_ui/features/home/models/category.dart';
import 'package:zomato_ui/features/home/view/pages/food_details_page.dart';
import 'package:zomato_ui/features/home/view/widgets/all_restaurant_tile.dart';
import 'package:zomato_ui/features/home/view/widgets/filter_section.dart';
import 'package:zomato_ui/features/home/view/widgets/recommended_tile.dart';
import 'package:zomato_ui/features/home/viewmodel/bloc/biryani_bloc.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      Category(
        title: 'All',
        imagePath:
            'https://imgs.search.brave.com/gZhCbL55oQD7l6XI8JM7yBIvSgCIa2ZB5FFYd3np_Zk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzVjLzZk/Lzg3LzVjNmQ4NzNi/MDU2ZGQ0NjllODE5/NGFjMGE5M2NkYzI5/LmpwZw',
      ),
      Category(
        title: 'Biryani',
        imagePath:
            'https://imgs.search.brave.com/Digb_MU8uq8BmH9rCgazHqdhcFJ8C94-8rbeUSlJSYU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9zcGlj/eS1jaGlja2VuLWJp/cnlhbmktdHJhZGl0/aW9uYWwtaGFuZGkt/Y2xheS1wb3Qtc2Vy/dmVkLW9uaW9uLXJh/aXRhLXNwaWN5LWNo/aWNrZW4tYmlyeWFu/aS10cmFkaXRpb25h/bC1oYW5kaS1jbGF5/LTIyNDY3NTM1MC5q/cGc',
      ),
      Category(
        title: 'Pizza',
        imagePath:
            'https://imgs.search.brave.com/FDJX9LUvs-dnvak0OPRSA9vqv1zTZyQmiGQUkL3lv4c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cy4x/MjNyZi5jb20vNDUw/d20vZ29sdWJzZXJn/ZWkvZ29sdWJzZXJn/ZWkxODAxL2dvbHVi/c2VyZ2VpMTgwMTAw/MDEzLzkyODYyOTAx/LXBpenphLXdpdGgt/c2F1c2FnZXMtb24t/YS1ibGFjay1zdG9u/ZS1iYWNrZ3JvdW5k/LmpwZz92ZXI9Ng',
      ),
      Category(
        title: 'Chicken',
        imagePath:
            'https://imgs.search.brave.com/tle4qQcWNT8aHJ-ncHh11wTMMgR2IYJ1Mp3dxPd0KHg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTc3/MTI2NTQxL3Bob3Rv/L2luZGlhbi1jaGlj/a2VuLWphbGZyZXpp/LWN1cnJ5LmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz1sT2tt/UmlCRm92cEtXNUZB/OWhuMF95WGc1SE9U/eDc4Q2FuNEUzSmF2/cEZFPQ',
      ),
      Category(
        title: 'Burger',
        imagePath:
            'https://imgs.search.brave.com/mmK84ZyBxPLyXYpE6WhRj7dnsW1TICceWoaQfhcrcEg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9jbGFz/c2ljLWFtZXJpY2Fu/LWZhc3QtZm9vZC1l/eGVtcGxpZmllZC1i/aWctdGFzdHktZG91/YmxlLWhhbWJ1cmdl/ci1iYWNvbi1ibGFj/ay1iYWNrZ3JvdW5k/LWZlYXR1cmluZy1z/ZXNhbWUtYnVuLTM3/MjAyODA4NC5qcGc',
      ),
      Category(
        title: 'Thali',
        imagePath:
            'https://imgs.search.brave.com/NIj5Xk5DD9N58TNcXLLx5wbN5iSdrptwx87DzwFzhKk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cy4x/MjNyZi5jb20vNDUw/d20vbXJva2lidWwv/bXJva2lidWwyMzAx/L21yb2tpYnVsMjMw/MTAwOTU2LzE5Njc2/OTcxOS1kZWxpY2lv/dXMtaW5kaWFuLWZv/b2QtdGhhbGktaW5k/aWFuLXN0eWxlLW1l/YWwtZm9yLWJyZWFr/ZmFzdC1haS1nZW5l/cmF0ZWQtaW1hZ2Uu/anBnP3Zlcj02',
      ),
    ];

    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          SizedBox(
            height: 90,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: categories.map((category) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.surface,
                      backgroundImage: CachedNetworkImageProvider(
                        category.imagePath,
                        errorListener: (_) =>
                            Container(color: AppColors.surface),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: categories.map((category) {
                return category.title == 'Biryani'
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 12.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FilterSection(),
                              const SizedBox(height: 16),
                              BlocBuilder<BiryaniBloc, BiryaniState>(
                                builder: (context, state) {
                                  if (state is BiryaniFailure) {
                                    return Text(state.message);
                                  } else if (state is BiryaniLoading) {
                                    return Center(
                                      child:
                                          const CircularProgressIndicator.adaptive(),
                                    );
                                  } else if (state is BiryaniSuccess) {
                                    final recommendedRestaurants =
                                        state.biryani.biryani.recommended;
                                    final allRestaurants =
                                        state.biryani.biryani.restaurants;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'RECOMMENDED FOR YOU',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        SizedBox(
                                          height: 340,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                recommendedRestaurants.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 8,
                                                  crossAxisSpacing: 8,
                                                  childAspectRatio: 1.2,
                                                ),
                                            itemBuilder: (context, index) {
                                              final item =
                                                  recommendedRestaurants[index];

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          FoodDetailsPage(
                                                            restaurant: item,
                                                          ),
                                                    ),
                                                  );
                                                },
                                                child: RecommendedTile(
                                                  recommended: item,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'ALL RESTAURANTS',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: allRestaurants.length,
                                          itemBuilder: (context, index) {
                                            final item = allRestaurants[index];

                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        FoodDetailsPage(
                                                          restaurant: item,
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: AllRestaurantTile(
                                                allRestaurant: item,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          category.title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 24),
                        ),
                      );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
