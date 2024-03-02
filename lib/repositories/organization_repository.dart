import 'dart:io';

import 'package:bhojansathi/models/OrganizationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OrganizationRepository {
  OrganizationRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? firebaseStorage,
  }) : _firestore = firestore ?? FirebaseFirestore.instance,
       _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  Stream<List<OrganizationModel>> getOrganizationList() {
    return _firestore.collection('organization').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => OrganizationModel.fromMap(doc.data()))
            .toList());
  }

  Future<OrganizationModel?> addOrganization(
      OrganizationModel organizationModel) async {
    try {
      final organizationID = _firestore.collection('organization').doc().id;
      final urls = await _uploadImage(organizationID, organizationModel.organizationImage);
      if(urls == null) {
        return null;
      } else {
        final organization = OrganizationModel(
          organizationId: organizationID,
          organizationName: organizationModel.organizationName,
          organizationAddress: organizationModel.organizationAddress,
          organizationContact: organizationModel.organizationContact,
          organizationEmail: organizationModel.organizationEmail,
          organizationDescription: organizationModel.organizationDescription,
          organizationType: organizationModel.organizationType,
          organizationCity: organizationModel.organizationCity,
          organizationState: organizationModel.organizationState,
          organizationPaymentMethod: organizationModel.organizationPaymentMethod,
          organizationImage: urls,
          organizationOwner: organizationModel.organizationOwner,
        );
        await _firestore
            .collection('organization')
            .doc(organizationID)
            .set(organization.toMap());
        return organization;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> updateOrganization(
      OrganizationModel organizationModel) async {
    try {
      await _firestore
          .collection('organization')
          .doc(organizationModel.organizationId)
          .update(organizationModel.toMap());
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteOrganization(String organizationId) async {
    try {
      await _firestore.collection('organization').doc(organizationId).delete();
    } catch (e) {
      return null;
    }
  }

  Future<String> _uploadImage(String organizationID, String imagePath) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('organization_images')
          .child(organizationID)
          .child(imagePath.split('/').last);
      final uploadTask = ref.putFile(File(imagePath));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      throw e;
    }
  }

}
