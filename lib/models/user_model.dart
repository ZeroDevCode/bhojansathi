import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String? email;

  const UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.email,
  });

  @override
  List<Object?> get props => [userId, firstName, lastName, email];

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return UserModel(
      userId: this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'first_name': firstName,
      'lastName': lastName, // Change this field to match Firestore document
      'email': email ?? '',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['first_name'] as String,
      lastName: map['lastName']
          as String, // Change this field to match Firestore document
      email: map['email'] as String?,
    );
  }
}
