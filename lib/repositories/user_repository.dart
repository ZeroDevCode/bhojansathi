import 'dart:developer' as dev;
import 'dart:io';

import 'package:bhojansathi/models/OrganizationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/UserModel.dart';

class UserRepository {
  UserRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
    FirebaseStorage? firebaseStorage,
  })
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;
  List<UserModel> userData= [];


  Stream<List<UserModel>> getFoodDonationList() {
    return _firestore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => UserModel.fromMap(doc.data()))
            .toList());
  }

  Stream<List<UserModel>> getUserList() {
    return _firestore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => UserModel.fromMap(doc.data()))
            .toList());
  }

  Future<UserModel> addUser(UserModel userModel) async {
    try {
      final user = _firebaseAuth.currentUser;
      final userDoc = _firestore.collection('users').doc(user!.uid);
      final url = await uploadImage(File(userModel.avatar), user.uid);
      await userDoc.set({
        'id': user.uid,
        'name': userModel.name,
        'email': userModel.email,
        'phone': userModel.phone,
        'avatar': url,
        'address': userModel.address,
        'organizations': userModel.organizations,
      });
      return userModel;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  Future<void> updateUser(UserModel userModel) async {
    try {
      final user = _firebaseAuth.currentUser;
      final userDoc = _firestore.collection('users').doc(user!.uid);
      await userDoc.update(userModel.toMap());
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

  Future<String> uploadImage(File file, String userId) async {
    try {
      final user = _firebaseAuth.currentUser;
      final ref = _firebaseStorage.ref().child('users').child(user!.uid).child('avatar');
      await ref.putFile(file, SettableMetadata(contentType: 'image/jpeg'));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }


}
