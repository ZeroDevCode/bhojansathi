import 'dart:io';

import 'package:bhojansathi/generated/assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//organization profile create screen

class OrganizationProfileCreateScreen extends StatefulWidget {
  const OrganizationProfileCreateScreen({super.key});

  @override
  State<OrganizationProfileCreateScreen> createState() =>
      _OrganizationProfileCreateScreenState();
}

class _OrganizationProfileCreateScreenState
    extends State<OrganizationProfileCreateScreen> {
  FilePickerResult? result = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create your Organization Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                result = (await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowMultiple: false,
                  allowedExtensions: ['jpg', 'png', 'jpeg'],
                ))!;
                setState(() {});
              },
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black12,
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    child: result != null
                        ? Image.file(
                            File(result!.files.single.path!),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            Assets.assetsLogo,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            buildTextField('Organization Name', Icons.business_outlined),
            buildTextField('About organization', Icons.description_outlined),
            buildTextField('Email', Icons.email_outlined),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: TextEditingController(
                  text: FirebaseAuth.instance.currentUser!.phoneNumber,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'Phone',
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            buildTextField('Website', Icons.email_outlined),
            buildTextField('Address', Icons.location_on_outlined),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //size
                minimumSize: Size(MediaQuery.of(context).size.width - 20, 50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, IconData? icon) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          labelText: labelText,
          alignLabelWithHint: true,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
