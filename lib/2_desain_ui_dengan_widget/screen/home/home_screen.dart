import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/model/tourism.dart';
import 'package:training/2_desain_ui_dengan_widget/screen/home/tourism_card_widget.dart';

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

          return TourismCard(tourism: tourism);
        },
      ),
    );
  }
}
