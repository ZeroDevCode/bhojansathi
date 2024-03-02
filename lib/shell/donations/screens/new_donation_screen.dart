//food donation screen with this fields : name, type, quantity, expiry date, location, contact number, image
//this screen is used to add new food donation
import 'dart:io';

import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/models/DonationModel.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as dev;
import 'package:intl/intl.dart';

class NewDonationScreen extends StatefulWidget {
  const NewDonationScreen({super.key});

  @override
  State<NewDonationScreen> createState() => _NewDonationScreenState();
}

class _NewDonationScreenState extends State<NewDonationScreen> {
  final picker = ImagePicker();
  final images = <String>[];
  bool isCurrentLocation = false;
  var latitude = 0;
  var longitude = 0;
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodDonationBloc, FoodDonationState>(
      listener: (context, state) {
        if (state is DonationLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            useSafeArea: true,
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
                  'Add Images',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "you can add upto 5 images (minimum 1) of the food you want to donate.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    cacheExtent: 100,
                    shrinkWrap: true,
                    reverse: images.isEmpty ? false : true,
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
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10),
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
                  decoration: MyStyle.outlinedTextStyle.copyWith(
                    labelText: 'Name',
                    hintText: 'Enter the name of the food',
                  ),
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 12,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name of the food';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: MyStyle.outlinedTextStyle.copyWith(
                    labelText: 'about the food donation',
                    hintText: 'Enter the name of the food',
                  ),
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 12,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the description of the food';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownMenu(
                  dropdownMenuEntries: Helper.dropdonwMenuEntries,
                  initialSelection: 'Select Category',
                  width: MediaQuery.of(context).size.width - 32,
                  onSelected: (value) {
                    _typeController.text = value;
                    setState(() {});
                  },
                  menuStyle: const MenuStyle(
                    visualDensity: VisualDensity(
                      horizontal: 0,
                      vertical: -2,
                    ),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 12,
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelStyle: TextStyle(fontSize: 12),
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                AbsorbPointer(
                  absorbing:
                      _typeController.text != 'Select Category' ? false : true,
                  child: TextFormField(
                    controller: _quantityController,
                    decoration: MyStyle.outlinedTextStyle.copyWith(
                      labelText: _typeController.text == 'Select Category'
                          ? 'Select Category first'
                          : _typeController.text == 'Raw'
                              ? 'Enter the quantity in KG'
                              : _typeController.text == 'Meal'
                                  ? 'Enter the no of meals'
                                  : 'Select category first',
                      hintText: _typeController.text == 'Select Category'
                          ? _typeController.text
                          : _typeController.text == 'Raw'
                              ? 'Enter the quantity in KG'
                              : _typeController.text == 'Meal'
                                  ? 'Enter the no of meals'
                                  : 'Select Category first',
                    ),
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 12,
                    ),
                    validator: (value) {
                      if (_typeController.text == 'Select Category') {
                        return 'Please enter the quantity of the food';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: AbsorbPointer(
                          absorbing: true,
                          child: TextFormField(
                            controller: _expiryDateController,
                            decoration: MyStyle.outlinedTextStyle.copyWith(
                              labelText: 'Expiry Date',
                              hintText: 'Enter the expiry date of the food',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () async {
                          final DateTime? datePicker = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (context.mounted) {
                            if (datePicker != null) {
                              final TimeOfDay? timePiker = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (timePiker != null) {
                                setState(() {
                                  DateTime temp = DateTime(
                                    datePicker.year,
                                    datePicker.month,
                                    datePicker.day,
                                    timePiker.hour,
                                    timePiker.minute,
                                  );
                                  _expiryDateController.text = DateFormat(
                                    'yyyy/MM/dd  HH:mm:ss a',
                                  ).format(temp);
                                  setState(() {});
                                });
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select the time'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select the date'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _locationController,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  decoration: MyStyle.outlinedTextStyle.copyWith(
                    labelText: 'Location',
                    alignLabelWithHint: true,
                    hintText: 'Enter the location of the food',
                  ),
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 12,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the location of the food';
                    }
                    return null;
                  },
                ),
                //switch to get current location
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                AbsorbPointer(
                  absorbing: true,
                  child: TextFormField(
                    controller: _contactNumberController,
                    decoration: MyStyle.outlinedTextStyle.copyWith(
                      labelText: 'Contact Number',
                      hintText: 'Enter the contact number',
                    ),
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 12,
                    ),
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
                    if (images.length > 2 &&
                        _formKey.currentState!.validate() &&
                        _typeController.text != 'Select Category') {
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
                        foodDonorLatitude:
                            isCurrentLocation ? latitude.toString() : '',
                        foodDonorLongitude:
                            isCurrentLocation ? longitude.toString() : '',
                        foodDonorUID:
                            FirebaseAuth.instance.currentUser?.uid ?? '',
                        foodDonationStatus: 'pending',
                        foodDonationDate: DateTime.now().toString(),
                        foodDonationTime: DateTime.now().toString(),
                        foodDonationID: DateTime.now().toString() +
                            FirebaseAuth.instance.currentUser!.uid,
                        foodRecipientId: '',
                      );
                      BlocProvider.of<FoodDonationBloc>(context).add(
                        AddFoodDonationEvent(foodDonationModel: donation),
                      );
                    } else {
                      Helper.scaffoldMessenger(
                        'Please fill all the fields or minimum 3 images are required.',
                        context,
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


// Row(
// children: [
// const Text(
// 'Donation location is your location current?',
// style: TextStyle(
// fontSize: 12,
// ),
// ),
// const Spacer(),
// Switch(
// value: isCurrentLocation,
// onChanged: (bool value) async {
// if (value) {
// final status = await Permission.location.request();
// if (status.isGranted) {
// final position =
// await Geolocator.getCurrentPosition(
// desiredAccuracy: LocationAccuracy.high,
// );
// print(position.latitude);
// latitude = position.latitude.toInt();
// longitude = position.longitude.toInt();
// setState(() {
// isCurrentLocation = value;
// _locationController.text =
// 'Latitude: $latitude, Longitude: $longitude';
// });
// } else {
// Helper.scaffoldMessenger(
// 'Location permission is required to get current location',
// context,
// );
// }
// } else {
// setState(
// () {
// isCurrentLocation = value;
// _locationController.clear();
// },
// );
// }
// },
// ),
// ],
// ),
