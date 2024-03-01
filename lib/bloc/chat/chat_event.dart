part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChatEvent extends ChatEvent {
  final String senderId;
  final String receiverId;

  const LoadChatEvent({required this.senderId, required this.receiverId});

  @override
  List<Object> get props => [senderId, receiverId];
}

class AddChatEvent extends ChatEvent {
  final ChatModel chatModel;

  const AddChatEvent({required this.chatModel});

  @override
  List<Object> get props => [chatModel];
}

class UpdateChatEvent extends ChatEvent {
  final List<ChatModel> chatModel;

  const UpdateChatEvent({required this.chatModel});

  @override
  List<Object> get props => [chatModel];
}
