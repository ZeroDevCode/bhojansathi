import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class Helper {
  static Future<bool> saveUserData(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(key, value);
  }

// Read Data
  static Future<String> getUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(value) as String;
  }

  static List<DropdownMenuEntry> dropdonwMenuEntries = [
    const DropdownMenuEntry(label: 'Select Category', value: 'Select Category'),
    const DropdownMenuEntry(value: 'Raw', label: "Raw Material"),
    const DropdownMenuEntry(value: 'Meal', label: "Meal"),
  ];

  static scaffoldMessenger(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: const Text(
            'Please fill all the fields or minimum 3 images are required.'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
    );
  }

}
