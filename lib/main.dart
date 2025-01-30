import 'package:flutter/material.dart';
import 'package:training/3_state_management/1_state/switch_widget.dart';
import 'package:training/3_state_management/2_tourism_app_state/my_app_ta_constraint.dart';

void main() {
  runApp(const MyAppTAConstraint());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "State Management",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwitchWidget(),
    );
  }
}
