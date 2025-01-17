import 'package:flutter/material.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/model/tourism.dart';

class TourismCard extends StatelessWidget {
  const TourismCard({
    super.key,
    required this.tourism,
    required this.onTap,
  });

  final Tourism tourism;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tourism.name,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
              Text(
              tourism.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
