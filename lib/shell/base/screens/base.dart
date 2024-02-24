import 'package:bhojansathi/config/routePaths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          indicatorColor: Colors.deepOrange,
          animationDuration: const Duration(milliseconds: 500),
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            if (index == 0) {
              context.go(RoutePaths.baseScreen);
            } else if (index == 1) {
              context.go(RoutePaths.chatScreen);
            } else if (index == 2) {
              context.go(RoutePaths.newDonationScreen);
            } else if (index == 3) {
              context.go(RoutePaths.historyScreen);
            } else if (index == 4) {
              context.go(RoutePaths.profileScreen);
            }
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined, color: Colors.white),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.chat_outlined, color: Colors.white),
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.edit_outlined, color: Colors.white),
              icon: Icon(Icons.edit_outlined),
              label: 'Donate',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark_outline, color: Colors.white),
              icon: Icon(Icons.bookmark_border),
              label: 'History',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_outline, color: Colors.white),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            )
          ],
        ));
  }
}
