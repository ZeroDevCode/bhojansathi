import 'dart:io';

import 'package:bhojansathi/models/DonationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DonationRepository {
  DonationRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
    FirebaseStorage? firebaseStorage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;

  Stream<List<FoodDonationModel>> getFoodDonationList() {
    return _firestore.collection('food_donation').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => FoodDonationModel.fromMap(doc.data()))
            .toList());
  }

  Stream<List<FoodDonationModel>> getFoodDonationListByUID(String uid) {
    return _firestore
        .collection('food_donation')
        .where('foodDonorUID', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => FoodDonationModel.fromMap(doc.data()))
            .toList());
  }

  Future<FoodDonationModel?> addFoodDonation(
      FoodDonationModel foodDonationModel) async {
    try {
      final user = _firebaseAuth.currentUser;
      final foodDonationID = _firestore.collection('food_donation').doc().id;
      final urls =
          await uploadFoodImages(foodDonationID, foodDonationModel.foodImage as List<String>);
      if (urls.length != foodDonationModel.foodImage.length) {
        return null;
      } else {
        final time = DateTime.now();
        final foodDonation = FoodDonationModel(
          foodName: foodDonationModel.foodName,
          foodType: foodDonationModel.foodType,
          foodQuantity: foodDonationModel.foodQuantity,
          foodExpiryDate: foodDonationModel.foodExpiryDate,
          foodDescription: foodDonationModel.foodDescription,
          foodImage: urls,
          foodDonorName: foodDonationModel.foodDonorName,
          foodDonorEmail: foodDonationModel.foodDonorEmail,
          foodDonorPhone: foodDonationModel.foodDonorPhone,
          foodDonorAddress: foodDonationModel.foodDonorAddress,
          foodDonorCity: foodDonationModel.foodDonorCity,
          foodDonorState: foodDonationModel.foodDonorState,
          foodDonorCountry: foodDonationModel.foodDonorCountry,
          foodDonorZipCode: foodDonationModel.foodDonorZipCode,
          foodDonorLatitude: foodDonationModel.foodDonorLatitude,
          foodDonorLongitude: foodDonationModel.foodDonorLongitude,
          foodDonorUID: user!.uid,
          foodDonationStatus: 'Pending',
          foodDonationDate: time.toString().split(' ')[0],
          foodDonationTime: time.toString().split(' ')[1],
          foodDonationID: foodDonationID,
          foodRecipientId: '',
          timeOfImages: foodDonationModel.timeOfImages,
        );
        await _firestore
            .collection('food_donation')
            .doc(foodDonationID)
            .set(foodDonation.toMap());
        print(foodDonation);
        return foodDonation;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateFoodDonation(FoodDonationModel foodDonationModel) async {
    final foodDonation = foodDonationModel.toMap();
    await _firestore
        .collection('food_donation')
        .doc(foodDonationModel.foodDonationID)
        .update(foodDonation);
  }

  Future<void> deleteFoodDonation(String foodDonationID) async {
    await _firestore.collection('food_donation').doc(foodDonationID).delete();
  }

  Future<String> uploadFoodImage(String foodDonationID, String filePath) async {
    final ref = _firebaseStorage.ref().child('food_donation/$foodDonationID');
    final uploadTask = ref.putFile(File(filePath));
    final snapshot = await uploadTask.whenComplete(() {});
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> deleteFoodImage(String foodDonationID) async {
    final ref = _firebaseStorage.ref().child('food_donation/$foodDonationID');
    await ref.delete();
  }

  Future<void> updateFoodDonationStatus(
      String foodDonationID, String status) async {
    await _firestore
        .collection('food_donation')
        .doc(foodDonationID)
        .update({'foodDonationStatus': status});
  }

  Future<List<String>> uploadFoodImages(
      String foodDonationID, List<String> filePaths) async {
    final List<String> urls = [];
    for (var filePath in filePaths) {
      final url = await uploadFoodImage(foodDonationID, filePath);
      urls.add(url);
    }
    return urls;
  }
}
