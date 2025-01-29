import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/4_slivers/sliver_appbar.dart';
import 'package:training/2_desain_ui_dengan_widget/4_slivers/sliver_grid_app.dart';
import 'package:training/2_desain_ui_dengan_widget/4_slivers/sliver_list_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sliver App Example",
      home: SliverAppbar(),
    );
  }
}
