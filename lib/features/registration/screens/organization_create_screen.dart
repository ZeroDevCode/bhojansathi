import 'dart:io';

import 'package:bhojansathi/bloc/organization/organization_bloc.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/OrganizationModel.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//organization profile create screen

class OrganizationProfileCreateScreen extends StatefulWidget {
  const OrganizationProfileCreateScreen({super.key});

  @override
  State<OrganizationProfileCreateScreen> createState() =>
      _OrganizationProfileCreateScreenState();
}

class _OrganizationProfileCreateScreenState
    extends State<OrganizationProfileCreateScreen> {
  FilePickerResult? result;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _paymentDetails = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization Profile'),
      ),
      body: BlocBuilder<OrganizationBloc, OrganizationState>(
        builder: (context, state) {
          if (state is OrganizationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrganizationLoadedState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrganizationErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'jpeg', 'png'],
                    );
                    setState(() {});
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepOrange,
                    child: result != null
                        ? Image.file(
                            File(result!.files.single.path!),
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextInputForm(context, _nameController,
                          "Organization Name", Icons.account_balance, false),
                      _buildTextInputForm(
                          context,
                          _addressController,
                          "Organization Address",
                          Icons.location_on_outlined,
                          false),
                      _buildTextInputForm(
                          context,
                          _contactController,
                          "Organization Contact",
                          Icons.phone_enabled_outlined,
                          false),
                      _buildTextInputForm(context, _emailController,
                          "Organization Email", Icons.email_outlined, false),
                      _buildTextInputForm(
                          context,
                          _descriptionController,
                          "Organization Description",
                          Icons.description_outlined,
                          false),
                      _buildTextInputForm(context, _typeController,
                          "Organization Type", Icons.category_outlined, false),
                      _buildTextInputForm(
                          context,
                          _cityController,
                          "Organization City",
                          Icons.location_city_outlined,
                          false),
                      _buildTextInputForm(
                          context,
                          _stateController,
                          "Organization State",
                          Icons.real_estate_agent_outlined,
                          false),
                      _buildTextInputForm(
                          context,
                          _pincodeController,
                          "Organization Pincode",
                          Icons.pin_drop_outlined,
                          false),
                      _buildTextInputForm(
                        context,
                        _paymentDetails,
                        "Enter Payment Details",
                        Icons.payment_outlined,
                        false,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    print("lkjhgfdsadfghjkl;lkjhgfdsadfghjkl;lkjhfds");
                    if (_formKey.currentState!.validate()) {
                      try {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  Text("Creating Organization...")
                                ],
                              ),
                            );
                          },
                        );
                        final firebaseStore = FirebaseFirestore.instance;
                        final docId =
                            firebaseStore.collection('organizations').doc().id;
                        final firebaseStorage = FirebaseStorage.instance;
                        final user = FirebaseAuth.instance.currentUser;
                        await firebaseStorage
                            .ref('organizations/$docId')
                            .putFile(File(result!.files.single.path!));
                        await firebaseStore
                            .collection('organizations')
                            .doc(user!.uid)
                            .set({
                          'organizationId': docId,
                          'organizationName': _nameController.text,
                          'organizationAddress': _addressController.text,
                          'organizationContact': _contactController.text,
                          'organizationEmail': _emailController.text,
                          'organizationDescription':
                              _descriptionController.text,
                          'organizationType': _typeController.text,
                          'organizationCity': _cityController.text,
                          'organizationState': _stateController.text,
                          'organizationPaymentMethod': _paymentDetails.text,
                          'organizationImage': result!.files.single.path!,
                          'organizationOwner': user.uid,
                        });
                        Navigator.pop(context);
                      } catch (e) {
                        Helper.scaffoldMessenger("Error", context);
                      }
                    } else {
                      Helper.scaffoldMessenger("Enter all details", context);
                    }
                  },
                  style: MyStyle.buttonStyle,
                  child: Text(
                    'Create Organization',
                    style: MyStyle.primaryButtonTextStyle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextInputForm(
      BuildContext context,
      TextEditingController controller,
      String labelText,
      IconData icon,
      bool isPassword) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          isDense: true,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }
}
