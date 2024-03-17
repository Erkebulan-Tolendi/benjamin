import 'package:benjamin/features/auth/ui/auth_page.dart';
import 'package:flutter/material.dart';

import '../lending/ui/lending_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final scrrens = [
    LandingPage(),
    AuthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: scrrens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 1),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: "Главный экран",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.border_color_outlined,
                ),
                label: "Заказы",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
