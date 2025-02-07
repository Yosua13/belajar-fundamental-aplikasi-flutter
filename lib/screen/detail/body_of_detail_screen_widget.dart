import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/screen/detail/card_menu.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({
    super.key,
    required this.restaurant,
  });

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: restaurant.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 18,
                      ),
                      const SizedBox.square(dimension: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      )
                    ],
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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Colors.grey[400],
                          ),
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox.square(dimension: 16),
            Text(
              "Kategori: ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox.square(dimension: 8),
            SizedBox(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: restaurant.categories.map((category) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                      ),
                    ),
                  );
                }).toList(),
              ),
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
          ],
        ),
      ),
    );
  }
}
