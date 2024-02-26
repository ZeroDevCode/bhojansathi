//food donation screen with this fields : name, type, quantity, expiry date, location, contact number, image
//this screen is used to add new food donation
import 'dart:io';

import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as dev;

class NewDonationScreen extends StatefulWidget {
  const NewDonationScreen({super.key});

  @override
  _NewDonationScreenState createState() {
    return _NewDonationScreenState();
  }
}

class _NewDonationScreenState extends State<NewDonationScreen> {
  final picker = ImagePicker();
  final images = <String>[];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactNumberController = TextEditingController(
    text: FirebaseAuth.instance.currentUser?.phoneNumber ?? '',
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodDonationBloc, FoodDonationState>(
      listener: (context, state) {
        if (state is DonationLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: const Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Uploading your donation"),
                  ],
                ),
              );
            },
          );
        } else if (state is DonationErrorState) {
          Navigator.pop(context);
          dev.log(state.message, name: 'DonationError');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is DonationOperationSucessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Donation added successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Donation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const Text(
                  ' Add Images',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "  you can add upto 5 images",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        images.length < 5 ? images.length + 1 : images.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await getImageFromSource(
                            source: ImageSource.gallery,
                            index: index,
                          );
                        },
                        child: Container(
                          width: 180,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                            image: (index < images.length)
                                ? DecorationImage(
                                    image: FileImage(
                                      File(images[index]),
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: (index < images.length)
                              ? null
                              : const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Name',
                    hintText: 'Enter the name of the food',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'about the food donation',
                    hintText: 'Enter the name of the food',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: _typeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Type',
                    hintText: 'Enter the type of the food',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Quantity',
                    hintText: 'Enter the quantity of the food',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: SelectionContainer.disabled(
                        child: TextFormField(
                          controller: _expiryDateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: 'Expiry Date',
                            hintText: 'Enter the expiry date of the food',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          setState(() {
                            _expiryDateController.text =
                                '0${picked.day}/${picked.month}/${picked.year}';
                          });
                        }
                      },
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _locationController,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Location',
                    alignLabelWithHint: true,
                    hintText: 'Enter the location of the food',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _contactNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Contact Number',
                    hintText: 'Enter the contact number',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.deepOrange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    dev.log(images.toString(), name: 'Donation');
                    if (_formKey.currentState!.validate()) {
                      final donation = FoodDonationModel(
                        foodName: _nameController.text,
                        foodType: _typeController.text,
                        foodQuantity: _quantityController.text,
                        foodExpiryDate: _expiryDateController.text,
                        foodDescription: _descriptionController.text,
                        foodImage: images,
                        foodDonorName: '',
                        foodDonorEmail: '',
                        foodDonorPhone: _contactNumberController.text,
                        foodDonorAddress: _locationController.text,
                        foodDonorCity: '',
                        foodDonorState: '',
                        foodDonorCountry: '',
                        foodDonorZipCode: '',
                        foodDonorLatitude: '',
                        foodDonorLongitude: '',
                        foodDonorUID:
                            FirebaseAuth.instance.currentUser?.uid ?? '',
                        foodDonationStatus: 'pending',
                        foodDonationDate: DateTime.now().toString(),
                        foodDonationTime: DateTime.now().toString(),
                        foodDonationID: DateTime.now().toString() +
                                FirebaseAuth.instance.currentUser!.uid ??
                            '',
                      );
                      BlocProvider.of<FoodDonationBloc>(context).add(
                        AddFoodDonationEvent(foodDonationModel: donation),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // food donation terms and conditions with reach text
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'By submitting this form, you agree to the terms and conditions of Bhojan Sathi.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImageFromSource({required ImageSource source, int? index}) async {
    dev.log('Index: $index | images size: ${images.length}', name: 'Image');
    final pickedFile = await picker.pickImage(source: source);
    XFile? xFilePick = pickedFile;

    if (xFilePick != null) {
      final file = File(pickedFile!.path);

      setState(
        () {
          images.add(file.path);
        },
      );
    } else {}
  }
}
