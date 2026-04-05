import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view/all_movies.dart';
import 'package:movies_app/view/home.dart';
import 'package:movies_app/view/search.dart';
import 'package:movies_app/view/watch_list.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> screens = [
    Home(),
    SearchScreen(),
    AllMovies(),
    WatchList(),
  ];

  int selectedIndex = 0;

  void bottomNavigate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_add), label: ''),
        ],
        currentIndex: selectedIndex,
        onTap: bottomNavigate,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.white,
      ),
      body: screens[selectedIndex],
    );
  }
}
