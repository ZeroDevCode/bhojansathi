import 'package:bhojansathi/generated/assets.dart';
import 'package:flutter/material.dart';

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
                buildUserTypeButton("Individual", Assets.usertypeIndividual),
                buildUserTypeButton(
                    "Organization", Assets.usertypeOrganization),
              ],
            ),
            SizedBox(height: 20),
            buildUserTypeButton("Volunteer", Assets.usertypeVolunter),
          ],
        ),
      ),
    );
  }

  Widget buildUserTypeButton(String userType, String assetPath) {
    return Column(
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
    );
  }
}
