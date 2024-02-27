import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;


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


}
