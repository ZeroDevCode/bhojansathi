import 'dart:io';

import 'package:bhojansathi/bloc/user/user_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/UserModel.dart';
import 'package:bhojansathi/shell/chat/screens/chat_list_screen.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as dev;

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  String imagePath = "";
  final TextEditingController _nameController = TextEditingController(
    text: FirebaseAuth.instance.currentUser!.displayName ?? "",
  );
  final TextEditingController _phoneNumberController = TextEditingController(
    text: FirebaseAuth.instance.currentUser!.phoneNumber ?? "",
  );
  final TextEditingController _emailController = TextEditingController(
    text: FirebaseAuth.instance.currentUser!.email ?? "",
  );
  final TextEditingController _addressController = TextEditingController(
    text: FirebaseAuth.instance.currentUser!.email ?? "",
  );

  @override
  void initState() {
    super.initState();
  }

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
      body: BlocListener<UserBloc, UserState>(
        bloc: BlocProvider.of<UserBloc>(context),
        listener: (context, state) {
          if (state is UserOperationSucessState) {
            context.go(RoutePaths.baseScreen);
          } else if (state is UserLoadingState) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(width: 20),
                      Text("Please wait..."),
                    ],
                  ),
                );
              },
            );
          } else if (state is UserErrorState) {
            Helper.scaffoldMessenger(state.message, context);
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.phone,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<UserBloc>(context).add(
                              AddUserEvent(
                                userModel: UserModel(
                                  id: FirebaseAuth.instance.currentUser!.uid,
                                  name: _nameController.text,
                                  phone: _phoneNumberController.text,
                                  email: _emailController.text,
                                  address: _addressController.text,
                                  avatar: imagePath,
                                  organizations: [],
                                ),
                              ),
                            );
                          } else {
                            Helper.scaffoldMessenger(
                              "Please fill all the fields",
                              context,
                            );
                          }
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
                  ),
                ),
              ],
            ),
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
                  photo = await _picker!.pickImage(source: ImageSource.camera);
                  dev.log(name: 'Hello', photo!.path);
                  setState(() {});
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
                  photo = await _picker!.pickImage(source: ImageSource.gallery);
                  dev.log(name: 'Hello', photo!.path);
                  setState(() {});
                  imagePath = photo!.path;
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
