import 'dart:developer' as dev;

import 'package:bhojansathi/models/OrganizationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/UserModel.dart';

class UserRepository {
  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;


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

  Future<UserModel?> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.userId).set(user.toMap());
    } catch (e) {
      dev.log('Got error in creating user: $e', name: 'User');
      rethrow;
    }
    return null;
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      dev.log('Got error in deleting user: $e', name: 'User');
      rethrow;
    }
  }

  Future<void> updateUserField(
      String userId, String field, String value) async {
    try {
      await _firestore.collection('users').doc(userId).update({field: value});
    } catch (e) {
      dev.log('Got error in updating user field: $e', name: 'User');
      rethrow;
    }
  }

  Future<void> registerOrganization(
      String userId, OrganizationModel organizationModel) async {
    try {
      await _firestore
          .collection('organizations')
          .doc(userId)
          .set(organizationModel.toMap());
    } catch (e) {
      dev.log('Got error in registering organization: $e', name: 'User');
      rethrow;
    }
  }
}
