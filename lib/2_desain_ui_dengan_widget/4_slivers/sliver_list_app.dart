import 'package:flutter/material.dart';

class SliverListApp extends StatelessWidget {
  const SliverListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList.list(
           children: [
             Container(color: Colors.red, height: 150.0),
             Container(color: Colors.purple, height: 200.0),
             Container(color: Colors.green, height: 100.0),
             Container(color: Colors.blue, height: 300.0),
             Container(color: Colors.amber, height: 150.0),
           ],
         ),
         SliverList.builder(
           itemCount: 1000,
           itemBuilder: (context, index) {
             return ListTile(
               title: Text("Index $index"),
             );
           },
         ),
        ],
      ),
    );
  }
}
