import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/1_layout_constraint/expanded_widget.dart';
import 'package:training/2_desain_ui_dengan_widget/1_layout_constraint/flexible_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    ExpandedWidget(),
                    FlexibleWidget(),
                  ],
                ),
                Row(
                  children: [
                    ExpandedWidget(),
                    ExpandedWidget(),
                  ],
                ),
                Row(
                  children: [
                    FlexibleWidget(),
                    FlexibleWidget(),
                  ],
                ),
                Row(
                  children: [
                    FlexibleWidget(),
                    ExpandedWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}