import 'dart:io';

import 'package:bhojansathi/generated/assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const IndividualUserRegisterScreen(),
    ),
  );
}

// Donation app individual user registration screen
class IndividualUserRegisterScreen extends StatefulWidget {
  const IndividualUserRegisterScreen({super.key});

  @override
  State<IndividualUserRegisterScreen> createState() =>
      _IndividualUserRegisterScreenState();
}

class _IndividualUserRegisterScreenState
    extends State<IndividualUserRegisterScreen> {
  ImagePicker? _picker;
  XFile? photo;
  String imagePath = "";
  final TextEditingController _nameController = TextEditingController(
    text: "FirebaseAuth.instance.currentUser!.displayName" ?? "",
  );
  final TextEditingController _phoneNumberController = TextEditingController(
    text: "FirebaseAuth.instance.currentUser!.phoneNumber" ?? "",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "FirebaseAuth.instance.currentUser!.email" ?? "",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "FirebaseAuth.instance.currentUser!.email" ?? "",
  );
  final TextEditingController _userRole = TextEditingController(
    text: "individual",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Create your Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      showImageSelectModel();
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: 140,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 0.5,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      height: 140,
                      child: imagePath.isNotEmpty
                          ? Image.file(
                              File(imagePath),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              Assets.assetsLogo,
                              fit: BoxFit.cover,
                            ),
                    ),
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.lerp(
                      BorderSide.none,
                      BorderSide.none,
                      0,
                    ),
                  ),
                  fillColor: Colors.deepOrange.shade50,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.lerp(
                      BorderSide.none,
                      BorderSide.none,
                      0,
                    ),
                  ),
                  fillColor: Colors.deepOrange.shade50,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.lerp(
                      BorderSide.none,
                      BorderSide.none,
                      0,
                    ),
                  ),
                  fillColor: Colors.deepOrange.shade50,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.lerp(
                      BorderSide.none,
                      BorderSide.none,
                      0,
                    ),
                  ),
                  fillColor: Colors.deepOrange.shade50,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    50,
                  ),
                ),
                onPressed: () {},
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
          ),
        ),
      ),
    );
  }

  void showImageSelectModel() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.camera_alt),
                ),
                title: const Text("Camera"),
                onTap: () async {
                  photo  = await _picker!.pickImage(source: ImageSource.camera);
                  imagePath = photo!.path;
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.image),
                ),
                title: const Text("Gallery"),
                onTap: () async {

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
