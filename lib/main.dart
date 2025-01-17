import 'package:flutter/material.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/screen/detail/detail_screen.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/screen/home/home_screen.dart';
import 'package:training/1_fundamental_flutter/7_latihan_tourism_app/static/navigation_route.dart';

import '1_fundamental_flutter/7_latihan_tourism_app/model/tourism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onDetach: () => debugPrint("app-detached"),
      onInactive: () => debugPrint("app-inactive"),
      onPause: () => debugPrint("app-pause"),
      onResume: () => debugPrint("app-resume"),
      onRestart: () => debugPrint("app-restart"),
      onShow: () => debugPrint("app-show"),
      onHide: () => debugPrint("app-hide"),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

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
