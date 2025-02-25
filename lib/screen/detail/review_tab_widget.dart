import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/dialog_add_review.dart';

class ReviewTab extends StatefulWidget {
  final RestaurantDetail restaurant;

  const ReviewTab({
    super.key,
    required this.restaurant,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ReviewTabState createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Ulasan Pengguna",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return DialogAddReview(
                          restaurantId: widget.restaurant.id,
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Tambah Review',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),

            // 🔹 DAFTAR ULASAN
            if (widget.restaurant.customerReviews.isEmpty)
              Center(
                child: Text(
                  "Belum ada ulasan",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            else
              ...widget.restaurant.customerReviews.map((review) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.pink),
                    title: Text(review.name),
                    subtitle: Text(review.review),
                    trailing: Text(review.date),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
