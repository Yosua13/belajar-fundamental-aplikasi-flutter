import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/model/tourism.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/screen/detail/detail_screen.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/screen/home/home_screen.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/static/navigation_route.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/style/themes/tourism_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
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
