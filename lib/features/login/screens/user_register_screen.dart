import 'package:bhojansathi/features/registration/screens/individual.dart';
import 'package:bhojansathi/features/registration/screens/organization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  String? role;

  // function to get user role from shared preferences
  Future<void> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    role = prefs.getString('role')!;
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: role == 'individual'
          ? IndividualUserRegisterScreen()
          : OrganizationProfileCreateScreen(),
    );
  }
}
