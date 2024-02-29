import 'package:equatable/equatable.dart';

class FoodDonationModel extends Equatable {
  String foodName;
  String foodType;
  String foodQuantity;
  String foodExpiryDate;
  String foodDescription;
  List foodImage;
  String foodDonorName;
  String foodDonorEmail;
  String foodDonorPhone;
  String foodDonorAddress;
  String foodDonorCity;
  String foodDonorState;
  String foodDonorCountry;
  String foodDonorZipCode;
  String foodDonorLatitude;
  String foodDonorLongitude;
  String foodDonorUID;
  String foodDonationStatus;
  String foodDonationDate;
  String foodDonationTime;
  String foodDonationID;
  String foodRecipientId;

  FoodDonationModel({
    required this.foodName,
    required this.foodType,
    required this.foodQuantity,
    required this.foodExpiryDate,
    required this.foodDescription,
    required this.foodImage,
    required this.foodDonorName,
    required this.foodDonorEmail,
    required this.foodDonorPhone,
    required this.foodDonorAddress,
    required this.foodDonorCity,
    required this.foodDonorState,
    required this.foodDonorCountry,
    required this.foodDonorZipCode,
    required this.foodDonorLatitude,
    required this.foodDonorLongitude,
    required this.foodDonorUID,
    required this.foodDonationStatus,
    required this.foodDonationDate,
    required this.foodDonationTime,
    required this.foodDonationID,
    required this.foodRecipientId,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'foodType': foodType,
      'foodQuantity': foodQuantity,
      'foodExpiryDate': foodExpiryDate,
      'foodDescription': foodDescription,
      'foodImage': foodImage,
      'foodDonorName': foodDonorName,
      'foodDonorEmail': foodDonorEmail,
      'foodDonorPhone': foodDonorPhone,
      'foodDonorAddress': foodDonorAddress,
      'foodDonorCity': foodDonorCity,
      'foodDonorState': foodDonorState,
      'foodDonorCountry': foodDonorCountry,
      'foodDonorZipCode': foodDonorZipCode,
      'foodDonorLatitude': foodDonorLatitude,
      'foodDonorLongitude': foodDonorLongitude,
      'foodDonorUID': foodDonorUID,
      'foodDonationStatus': foodDonationStatus,
      'foodDonationDate': foodDonationDate,
      'foodDonationTime': foodDonationTime,
      'foodDonationID': foodDonationID,
      'foodRecipientId': foodRecipientId,
    };
  }

  //from map to model
  factory FoodDonationModel.fromMap(Map<String, dynamic> map) {
    return FoodDonationModel(
      foodName: map['foodName'],
      foodType: map['foodType'],
      foodQuantity: map['foodQuantity'],
      foodExpiryDate: map['foodExpiryDate'],
      foodDescription: map['foodDescription'],
      foodImage: map['foodImage'],
      foodDonorName: map['foodDonorName'],
      foodDonorEmail: map['foodDonorEmail'],
      foodDonorPhone: map['foodDonorPhone'],
      foodDonorAddress: map['foodDonorAddress'],
      foodDonorCity: map['foodDonorCity'],
      foodDonorState: map['foodDonorState'],
      foodDonorCountry: map['foodDonorCountry'],
      foodDonorZipCode: map['foodDonorZipCode'],
      foodDonorLatitude: map['foodDonorLatitude'],
      foodDonorLongitude: map['foodDonorLongitude'],
      foodDonorUID: map['foodDonorUID'],
      foodDonationStatus: map['foodDonationStatus'],
      foodDonationDate: map['foodDonationDate'],
      foodDonationTime: map['foodDonationTime'],
      foodDonationID: map['foodDonationID'],
      foodRecipientId: map['foodRecipientId'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        foodName,
        foodType,
        foodQuantity,
        foodExpiryDate,
        foodDescription,
        foodImage,
        foodDonorName,
        foodDonorEmail,
        foodDonorPhone,
        foodDonorAddress,
        foodDonorCity,
        foodDonorState,
        foodDonorCountry,
        foodDonorZipCode,
        foodDonorLatitude,
        foodDonorLongitude,
        foodDonorUID,
        foodDonationStatus,
        foodDonationDate,
        foodDonationTime,
        foodDonationID,
        foodRecipientId,
      ];
}
