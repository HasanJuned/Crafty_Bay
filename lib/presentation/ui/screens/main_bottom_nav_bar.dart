import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            _selectedIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: 'Wishlist'),
          ]),
    );
  }
}
