import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/card_menu_widget.dart';
import 'package:restaurant_app/screen/detail/review_tab_widget.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({
    super.key,
    required this.restaurant,
  });

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: restaurant.pictureId,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 250,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox.square(dimension: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                restaurant.id,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  Text(
                                    restaurant.city,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    ", ${restaurant.address}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox.square(dimension: 2),
                              Row(
                                children: [
                                  Text(
                                    restaurant.rating.toString(),
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  const SizedBox.square(dimension: 4),
                                  RatingBarIndicator(
                                    rating: restaurant.rating,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemSize: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.pink,
                      tabs: [
                        Tab(text: "Deskripsi"),
                        Tab(text: "Menu"),
                        Tab(text: "Ulasan"),
                      ],
                    ),

                    // 🔹 TAB CONTENT
                    SizedBox(
                      height: 400, // Tentukan tinggi konten tab
                      child: TabBarView(
                        children: [
                          // TAB KATEGORI
                          _buildCategoryTab(context),
                          // TAB MENU (Makanan & Minuman)
                          _buildMenuTab(context),
                          // TAB ULASAN
                          ReviewTab(
                            restaurant: restaurant,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox.square(dimension: 16),
          Text(
            "Kategori: ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Wrap(
            spacing: 8,
            children: restaurant.categories.map((category) {
              return Chip(
                label: Text(category.name),
                backgroundColor: Colors.pink[50],
              );
            }).toList(),
          ),
          const SizedBox.square(dimension: 16),
          Text(
            "Deskripsi: ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox.square(dimension: 8),
          Text(
            restaurant.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTab(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox.square(dimension: 24),
            Text(
              'Menu Makanan :',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox.square(dimension: 4),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
                children: restaurant.menus.foods.map((food) {
                  return CardMenu(
                    image: 'assets/images/makanan.jpg',
                    name: food.name,
                  );
                }).toList(),
              ),
            ),
            const SizedBox.square(dimension: 16),
            Text(
              'Menu Minuman :',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
                children: restaurant.menus.drinks.map((drink) {
                  return CardMenu(
                    image: 'assets/images/minuman.jpg',
                    name: drink.name,
                  );
                }).toList(),
              ),
            ),
          ]),
    );
  }
}
