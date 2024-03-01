import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/utils/style.dart';
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
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.grey.shade600,
        elevation: 20,
        animationDuration: const Duration(milliseconds: 500),
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 0) {
            context.go(RoutePaths.baseScreen);
          } else if (index == 1) {
            context.go(RoutePaths.requestDonationScreen);
          } else if (index == 2) {
            context.go(RoutePaths.exploreScreen);
          } else if (index == 3) {
            context.go(RoutePaths.chatScreen);
          } else if (index == 4) {
            context.go(RoutePaths.historyScreen);
          }
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined, color: Colors.white),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.edit_outlined, color: Colors.white),
            icon: Icon(Icons.edit_outlined),
            label: 'Request',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore_outlined, color: Colors.white),
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.comment_outlined, color: Colors.white),
            icon: Icon(Icons.comment_outlined),
            label: 'Chat',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark_outline, color: Colors.white),
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'History',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Donate",
          style: MyStyle.primaryButtonTextStyle,
        ),
        icon: Icon(
          Icons.handshake_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          context.push(RoutePaths.newDonationScreen);
        },
      ),
    );
  }
}
