import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/data/api/api_service.dart';
import 'package:training/4_networking/4_tourism_api_provider/my_app_ta_constraint.dart';
import 'package:training/4_networking/4_tourism_api_provider/provider/detail/bookmark_list_provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/provider/detail/tourism_detail_provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/provider/home/tourism_list_provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/provider/main/index_nav_provider.dart';

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
        Provider(
          create: (context) => ApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismListProvider(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismDetailProvider(
            context.read<ApiService>(),
          ),
        ),
      ],
      child: const MyAppTAConstraint(),
    ),
  );
}
