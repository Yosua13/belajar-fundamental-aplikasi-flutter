import 'package:flutter/material.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/model/tourism.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/screen/home/tourism_card_widget.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/static/navigation_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];

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
