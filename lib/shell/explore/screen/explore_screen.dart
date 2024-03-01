import 'package:bhojansathi/common/app_bar.dart';
import 'package:bhojansathi/shell/explore/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostWidget(),
          ],
        ),
      ),
    );
  }
}
