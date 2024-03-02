import 'package:equatable/equatable.dart';

class OrganizationModel extends Equatable{
  final String organizationId;
  final String organizationName;
  final String organizationAddress;
  final String organizationContact;
  final String organizationEmail;
  final String organizationDescription;
  final String organizationType;
  final String organizationCity;
  final String organizationState;
  final String organizationPaymentMethod;
  final String organizationImage;
  final String organizationOwner;

  const OrganizationModel({
    required this.organizationId,
    required this.organizationName,
    required this.organizationAddress,
    required this.organizationContact,
    required this.organizationEmail,
    required this.organizationDescription,
    required this.organizationType,
    required this.organizationCity,
    required this.organizationState,
    required this.organizationPaymentMethod,
    required this.organizationImage,
    required this.organizationOwner,
  });


  Map<String, dynamic> toMap() {
    return {
      'organizationId': organizationId,
      'organizationName': organizationName,
      'organizationAddress': organizationAddress,
      'organizationContact': organizationContact,
      'organizationEmail': organizationEmail,
      'organizationDescription': organizationDescription,
      'organizationType': organizationType,
      'organizationCity': organizationCity,
      'organizationState': organizationState,
      'organizationPaymentMethod': organizationPaymentMethod,
      'organizationImage': organizationImage,
      'organizationOwner': organizationOwner,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      organizationId: map['organizationId'] as String,
      organizationName: map['organizationName'] as String,
      organizationAddress: map['organizationAddress'] as String,
      organizationContact: map['organizationContact'] as String,
      organizationEmail: map['organizationEmail'] as String,
      organizationDescription: map['organizationDescription'] as String,
      organizationType: map['organizationType'] as String,
      organizationCity: map['organizationCity'] as String,
      organizationState: map['organizationState'] as String,
      organizationPaymentMethod: map['organizationPaymentMethod'] as String,
      organizationImage: map['organizationImage'] as String,
      organizationOwner: map['organizationOwner'] as String,
    );
  }

  @override
  List<Object?> get props => [
    organizationId,
    organizationName,
    organizationAddress,
    organizationContact,
    organizationEmail,
    organizationDescription,
    organizationType,
    organizationCity,
    organizationState,
    organizationPaymentMethod,
    organizationImage,
    organizationOwner,
  ];
}
