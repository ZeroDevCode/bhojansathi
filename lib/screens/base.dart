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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            context.go(RoutePaths.homeScreen);
          } else if (index == 1) {
            context.go(RoutePaths.chatScreen);
          } else if (index == 2) {
            context.go(RoutePaths.notificationScreen);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_outlined),
            label: 'New Donation',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
      )
    );
  }
}
