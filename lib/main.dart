import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/my_app_ta_constraint.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/provider/detail/bookmark_list_provider.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/provider/main/index_nav_provider.dart';

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
