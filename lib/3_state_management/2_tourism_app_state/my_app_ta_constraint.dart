import 'package:flutter/material.dart';
import 'package:training/3_state_management/2_tourism_app_state/model/tourism.dart';
import 'package:training/3_state_management/2_tourism_app_state/screen/detail/detail_screen.dart';
import 'package:training/3_state_management/2_tourism_app_state/screen/main/main_screen.dart';
import 'package:training/3_state_management/2_tourism_app_state/static/navigation_route.dart';

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
