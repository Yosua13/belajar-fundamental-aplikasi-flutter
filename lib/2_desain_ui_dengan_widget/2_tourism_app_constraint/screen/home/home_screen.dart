import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/model/tourism.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/screen/home/tourism_card_widget.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/static/navigation_route.dart';

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
