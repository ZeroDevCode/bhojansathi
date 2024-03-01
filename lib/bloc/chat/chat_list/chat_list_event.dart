part of 'chat_list_bloc.dart';

abstract class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

class LoadChatListEvent extends ChatListEvent {
  final String userId;

  const LoadChatListEvent({required this.userId});
}

class AddChatListEvent extends ChatListEvent {
  final ChatListModel chatListModel;

  const AddChatListEvent({required this.chatListModel});
}

class UpdateChatListEvent extends ChatListEvent {
  final List<ChatListModel> chatListModel;

  const UpdateChatListEvent({required this.chatListModel});
}

class DeleteChatListEvent extends ChatListEvent {
  final String chatListId;

  const DeleteChatListEvent({required this.chatListId});
}
