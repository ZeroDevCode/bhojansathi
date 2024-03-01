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


  Future<UserModel?> getUser(String userId) async {
    try {
      final user = await _firestore.collection('users').doc(userId.replaceAll("+", "")).get();
      print("$user======================");
      if (user.exists) {
        return UserModel.fromMap(user.data()!);
      }
    } catch (e) {
      dev.log('Got error in getting user: $e', name: 'User');
      return null;
    }
    return null;
  }

  Future<UserModel?> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.userId).set(user.toMap());
      return user;
    } catch (e) {
      dev.log('Got error in creating user: $e', name: 'User');
      return null;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.userId).update(user.toMap());
    } catch (e) {
      dev.log('Got error in updating user: $e', name: 'User');
    }
  }

  Stream<UserModel?> getUserStream(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map((event) {
      if (event.exists) {
        return UserModel.fromMap(event.data()!);
      }
      return null;
    });
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      dev.log('Got error in deleting user: $e', name: 'User');
    }
  }

  Future<OrganizationModel?> getOrganization(String organizationId) async {
    try {
      final organization = await _firestore.collection('organizations').doc(organizationId).get();
      if (organization.exists) {
        return OrganizationModel.fromMap(organization.data()!);
      }
    } catch (e) {
      dev.log('Got error in getting organization: $e', name: 'Organization');
      return null;
    }
    return null;
  }

  Future<OrganizationModel?> createOrganization(OrganizationModel organization) async {
    try {
      await _firestore.collection('organizations').doc(organization.id).set(organization.toMap());
      return organization;
    } catch (e) {
      dev.log('Got error in creating organization: $e', name: 'Organization');
      return null;
    }
  }

  Future<void> updateOrganization(OrganizationModel organization) async {
    try {
      await _firestore.collection('organizations').doc(organization.id).update(organization.toMap());
    } catch (e) {
      dev.log('Got error in updating organization: $e', name: 'Organization');
    }
  }

  Stream<OrganizationModel?> getOrganizationStream(String organizationId) {
    return _firestore.collection('organizations').doc(organizationId).snapshots().map((event) {
      if (event.exists) {
        return OrganizationModel.fromMap(event.data()!);
      }
      return null;
    });
  }

  Future<void> deleteOrganization(String organizationId) async {
    try {
      await _firestore.collection('organizations').doc(organizationId).delete();
    } catch (e) {
      dev.log('Got error in deleting organization: $e', name: 'Organization');
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      final users = await _firestore.collection('users').get();
      return users.docs.map((e) => UserModel.fromMap(e.data())).toList();
    } catch (e) {
      dev.log('Got error in getting all users: $e', name: 'User');
      return [];
    }
  }

  Future<List<OrganizationModel>> getAllOrganizations() async {
    try {
      final organizations = await _firestore.collection('organizations').get();
      return organizations.docs.map((e) => OrganizationModel.fromMap(e.data())).toList();
    } catch (e) {
      dev.log('Got error in getting all organizations: $e', name: 'Organization');
      return [];
    }
  }

  Future<List<UserModel>> searchUsers(String query) async {
    try {
      final users = await _firestore.collection('users').where('userName', isGreaterThanOrEqualTo: query).get();
      return users.docs.map((e) => UserModel.fromMap(e.data())).toList();
    } catch (e) {
      dev.log('Got error in searching users: $e', name: 'User');
      return [];
    }
  }

  Future<List<OrganizationModel>> searchOrganizations(String query) async {
    try {
      final organizations = await _firestore.collection('organizations').where('organizationName', isGreaterThanOrEqualTo: query).get();
      return organizations.docs.map((e) => OrganizationModel.fromMap(e.data())).toList();
    } catch (e) {
      dev.log('Got error in searching organizations: $e', name: 'Organization');
      return [];
    }
  }



}
