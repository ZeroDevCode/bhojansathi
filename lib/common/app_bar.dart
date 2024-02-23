import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/location.png',
          width: 26,
          height: 26,
        ),
        onPressed: () {
          // Handle location icon tap
        },
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOME',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Swaminarayan Temple, Rajkot',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // Handle bell icon tap
          },
        ),
        // IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {
        //     // Handle three-line icon tap
        //   },
        // ),
      ],
      titleSpacing: 0, // Set titleSpacing to reduce spacing
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
