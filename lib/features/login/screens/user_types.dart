import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Identify Yourself'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildUserTypeButton(
                  "Individual",
                  Assets.usertypeIndividual,
                  () {
                    Helper.saveUserData('role', 'individual');
                    context.go('/user_register_screen');
                  },
                ),
                buildUserTypeButton(
                  "Organization",
                  Assets.usertypeOrganization,
                  () {
                    Helper.saveUserData('role', 'organization');
                    context.go('/user_register_screen');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildUserTypeButton(
              "Volunteer",
              Assets.usertypeVolunter,
              () {
                Helper.saveUserData('role', 'volunteer');
                context.go('/user_register_screen');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserTypeButton(
    String userType,
    String assetPath,
    VoidCallback onNext,
  ) {
    return InkWell(
      onTap: onNext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            width: 100,
            height: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Image.asset(
              assetPath,
              scale: 1.5,
            ),
          ),
          Text(userType),
        ],
      ),
    );
  }
}
