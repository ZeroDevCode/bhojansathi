import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String senderId;
  final String receiverId;
  final String name;
  final String message;
  final String time;

  ChatModel({
    required this.senderId,
    required this.receiverId,
    required this.name,
    required this.message,
    required this.time,
  });

  ChatModel copyWith({
    String? senderId,
    String? receiverId,
    String? name,
    String? message,
    String? time,
    String? avatarUrl,
  }) {
    return ChatModel(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'name': name,
      'message': message,
      'time': time,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      name: map['name'],
      message: map['message'],
      time: map['time'],
    );
  }

  @override
  // TODO: implement props,
  List<Object?> get props => [
        senderId,
        receiverId,
        name,
        message,
        time,
      ];
}
