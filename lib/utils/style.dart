import 'package:flutter/material.dart';

class MyStyle {
  static var buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static var primaryButtonTextStyle =
      const TextStyle(fontSize: 12, color: Colors.white);

  static var outlinedTextStyle = const InputDecoration(
    border: OutlineInputBorder(),
    isDense: true,
    labelStyle: TextStyle(fontSize: 12),
    hintStyle: TextStyle(fontSize: 12),
  );

  static var containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.grey.withOpacity(0.2),
    ),
  );

  static var textHeadingStyle =  const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static var textSubHeadingStyle =  const TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
}
