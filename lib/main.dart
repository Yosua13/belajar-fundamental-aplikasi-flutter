import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/5_latihan_slivers/screens/learning_path_screen.dart';
import 'package:training/2_desain_ui_dengan_widget/5_latihan_slivers/utils/sliver_header_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sliver App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LearningPathScreen(),
    );
  }
}
