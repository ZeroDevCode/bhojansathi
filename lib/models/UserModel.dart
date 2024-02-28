import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final String? role;

  const UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
  });

  @override
  List<Object?> get props => [userId, firstName, lastName, phoneNumber];

  UserModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? role,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'first_name': firstName,
      'lastName': lastName, // Change this field to match Firestore document
      'phoneNumber': phoneNumber ?? '',
      'role': role ?? '',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['first_name'] as String,
      lastName: map['lastName'] as String,
      phoneNumber: map['phoneNumber'] as String?,
      role: map['role'] as String?,
    );
  }
}
