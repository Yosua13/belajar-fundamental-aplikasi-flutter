import 'package:flutter/material.dart';

class SliverGridApp extends StatelessWidget {
  const SliverGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.blue[100 * (index % 9)],
                  alignment: Alignment.center,
                  child: Text("Index $index"),
                );
              },
              childCount: 50,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 4,
            ),
          ),
        ],
      ),
    );
  }
}
