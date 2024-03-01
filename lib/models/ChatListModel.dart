import 'package:equatable/equatable.dart';

class ChatListModel extends Equatable {
  final String name;
  final String message;
  final String avatarUrl;
  final String senderId;
  final String receiverId;

  const ChatListModel({
    required this.name,
    required this.message,
    required this.avatarUrl,
    required this.senderId,
    required this.receiverId,
  });

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      name: map['name'],
      message: map['message'],
      avatarUrl: map['avatarUrl'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
      'avatarUrl': avatarUrl,
      'senderId': senderId,
      'receiverId': receiverId,
    };
  }

  ChatListModel copyWith({
    String? name,
    String? message,
    String? avatarUrl,
    String? senderId,
    String? receiverId,
  }) {
    return ChatListModel(
      name: name ?? this.name,
      message: message ?? this.message,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
    );
  }

  @override
  List<Object?> get props => [
        name,
        message,
        avatarUrl,
        senderId,
        receiverId,
      ];
}
