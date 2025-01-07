import 'package:flutter/material.dart';
import 'package:task_octohub/const.dart';
import 'package:task_octohub/screens/home_screen.dart';
import 'package:task_octohub/screens/password_screend.dart';
import 'package:task_octohub/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PasswordScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(
          3,
          (index) => BottomNavigationBarItem(
            icon: _currentIndex == index
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Icon(
                        _getIconForIndex(index),
                        color: whiteColor,
                      ),
                    ],
                  )
                : Icon(
                    _getIconForIndex(index),
                    color: Colors.grey,
                  ),
            label: '',
          ),
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.key_rounded;
      case 1:
        return Icons.verified_user_outlined;
      case 2:
        return Icons.settings;
      default:
        return Icons.help;
    }
  }
}
