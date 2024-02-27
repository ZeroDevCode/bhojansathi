import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/UserModel.dart';

class UserRepository {
  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  Future<UserModel?> registerUser(UserModel user) async {
    try {
      // Ensure that user.userId is not empty or null
      if (user.userId.isNotEmpty) {
        await _firestore.collection('users').doc(user.userId).set({
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email,
        });

        return user;
      } else {
        dev.log('Error: Empty or null userId', name: 'User');
        return null;
      }
    } catch (e) {
      dev.log('Got registration error: $e', name: 'User');
      return null;
    }
  }

  Future<UserModel?> updateUser(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.userId)
          .update(user.toMap());
      dev.log('${user.toString()} success');
      return user;
    } catch (e) {
      dev.log('Got error in updating user: $e', name: 'User');
      return null;
    }
  }

  Stream<UserModel?> getUserStream(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map((event) {
      final data = event.data();

      if (data != null) {
        var user = UserModel.fromMap(data);
        return user;
      }

      return null;
    });
  }
}
