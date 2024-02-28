import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          elevation: 5,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  //circle avatar, name, email , edit button
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Assets.assetsLogo),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Email'),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.edit_outlined, color: Colors.deepOrange,),
                  SizedBox(width: 10,)
                ],
              ),
              const Divider(),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: const Text('Account'),
                leading: const Icon(Icons.person_outline),
                onTap: () {
                  //go to my donations
                },
              ),
              const Divider(),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: const Text('Privacy & Security'),
                leading: const Icon(Icons.lock_outline),
                onTap: () {
                  //go to my donations
                },
              ),
              const Divider(),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: const Text('My Donations'),
                leading: const Icon(Icons.handshake_outlined),
                onTap: () {
                 context.push(RoutePaths.profileMyDonationScreen);
                },
              ),
            ],
          ),
        ));
  }
}
