import 'package:flutter/material.dart';
import 'package:training/1_fundamental_flutter/3_latihan_penerapan_lifecycle/my_stateful_widget_page.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/another_screen.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/first_screen.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/replacement_screen.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/return_data_screen.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/second_screen.dart';
import 'package:training/1_fundamental_flutter/4_navigation_routing/second_screen_with_data.dart';
import 'package:training/1_fundamental_flutter/5_interaction/detector_example.dart';
import 'package:training/1_fundamental_flutter/5_interaction/listener_screen.dart';
import 'package:training/1_fundamental_flutter/6_latihan_gesture_detector/home_page.dart';

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
      title: 'Flutter Lifecycle App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const FirstScreen(),
      //   '/second': (context) => const SecondScreen(),
      //   '/second-with-data': (context) => SecondScreenWithData(
      //         data: ModalRoute.of(context)?.settings.arguments as String,
      //       ),
      //   '/return-data': (context) => const ReturnDataScreen(),
      //   '/replacement': (context) => const ReplacementScreen(),
      //   '/another': (context) => const AnotherScreen(),
      // },
    );
  }
}
