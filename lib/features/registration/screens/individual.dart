import 'package:flutter/material.dart';

// Donation app individual user registration screen
class IndividualUserRegisterScreen extends StatefulWidget {
  const IndividualUserRegisterScreen({super.key});

  @override
  State<IndividualUserRegisterScreen> createState() =>
      _IndividualUserRegisterScreenState();
}

class _IndividualUserRegisterScreenState
    extends State<IndividualUserRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual User Register'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width-20, 50),
              backgroundColor: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // register user
            },
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),),
    );
  }
}
