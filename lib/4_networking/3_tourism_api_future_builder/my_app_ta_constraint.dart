import 'package:flutter/material.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/screen/detail/detail_screen.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/screen/main/main_screen.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/static/navigation_route.dart';

class MyAppTAConstraint extends StatelessWidget {
  const MyAppTAConstraint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              tourismId: ModalRoute.of(context)?.settings.arguments as int,
            ),
      },
    );
  }
}
