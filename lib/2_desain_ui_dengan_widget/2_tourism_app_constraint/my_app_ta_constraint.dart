import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/model/tourism.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/screen/detail/detail_screen.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/screen/home/home_screen.dart';
import 'package:training/2_desain_ui_dengan_widget/2_tourism_app_constraint/static/navigation_route.dart';

class MyAppTAConstraint extends StatelessWidget {
  const MyAppTAConstraint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => const HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
            ),
      },
    );
  }
}
