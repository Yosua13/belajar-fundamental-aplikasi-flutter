import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/my_app_ta_constraint.dart';
import 'package:training/3_state_management/3_tourism_app_provider/provider/detail/bookmark_list_provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/provider/main/index_nav_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkListProvider(),
        ),
      ],
      child: const MyAppTAConstraint(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: ChangeNotifierProvider(
//         create: (context) => CounterProvider(),
//         child: const MyAppTAConstraint(),
//       ),
//     );
//   }
// }
