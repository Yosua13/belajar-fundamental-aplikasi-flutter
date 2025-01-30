import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/provider/main/index_nav_provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/screen/bookmark/bookmark_screen.dart';
import 'package:training/3_state_management/3_tourism_app_provider/screen/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // int _indexBottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            1 => const BookmarkScreen(),
            _ => const HomeScreen(),
          };
        },
      ),
      // switch (_indexBottomNavBar) {
      //   0 => const HomeScreen(),
      //   _ => const BookmarkScreen(),
      // },

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
        // currentIndex: _indexBottomNavBar,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavBar = index;
          // setState(() {
          //   _indexBottomNavBar = index;
          // });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: "Bookmarks",
            tooltip: "Bookmarks",
          ),
        ],
      ),
    );
  }
}
