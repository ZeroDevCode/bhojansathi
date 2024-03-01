part of 'chat_list_bloc.dart';

abstract class ChatListState extends Equatable {
  const ChatListState();

  @override
  List<Object> get props => [];
}

class ChatListInitialState extends ChatListState {}

class ChatListLoadingState extends ChatListState {}

class ChatListLoadedState extends ChatListState {
  final List<ChatListModel> chatList;

  const ChatListLoadedState({required this.chatList});

  @override
  List<Object> get props => [chatList];
}

class ChatListOperationSucessState extends ChatListState {}


class ChatListErrorState extends ChatListState {
  final String message;

  const ChatListErrorState({required this.message});

  @override
  List<Object> get props => [message];
}