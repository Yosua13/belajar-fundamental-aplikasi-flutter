import 'package:flutter/material.dart';
import 'package:training/3_state_management/2_tourism_app_state/model/tourism.dart';
import 'package:training/3_state_management/2_tourism_app_state/screen/home/tourism_card_widget.dart';
import 'package:training/3_state_management/2_tourism_app_state/static/navigation_route.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark List"),
      ),
      body: ListView.builder(
        itemCount: bookMarkTourismList.length,
        itemBuilder: (context, index) {
          final tourism = bookMarkTourismList[index];

          return TourismCard(
            tourism: tourism,
            onTap: () {
              Navigator.pushNamed(
                context,
                NavigationRoute.detailRoute.name,
                arguments: tourism,
              );
            },
          );
        },
      ),
    );
  }
}
