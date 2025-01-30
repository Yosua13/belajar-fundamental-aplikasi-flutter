import 'package:flutter/material.dart';
import 'package:training/3_state_management/3_tourism_app_provider/model/tourism.dart';
import 'package:training/3_state_management/3_tourism_app_provider/screen/detail/detail_screen.dart';
import 'package:training/3_state_management/3_tourism_app_provider/screen/main/main_screen.dart';
import 'package:training/3_state_management/3_tourism_app_provider/static/navigation_route.dart';

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
              tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
            ),
      },
    );
  }
}
