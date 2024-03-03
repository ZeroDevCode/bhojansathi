import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;
  final List organizations;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.address,
    required this.organizations,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    avatar,
    address,
    organizations,
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'address': address,
      'organizations': organizations,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String ?? '',
      name: map['name'] as String ?? '',
      email: map['email'] as String ?? '' ,
      phone: map['phone'] as String ?? '',
      avatar: map['avatar'] as String ?? '',
      address: map['address'] as String ?? '',
      organizations: map['organizations'] as List ?? [],
    );
  }
}
