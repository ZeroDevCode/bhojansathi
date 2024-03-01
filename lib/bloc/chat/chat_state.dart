part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<ChatModel> chatList;

  const ChatLoadedState({required this.chatList});

  @override
  List<Object> get props => [chatList];
}

class ChatOperationSucessState extends ChatState {}

class ChatErrorState extends ChatState {
  final String message;

  const ChatErrorState({required this.message});

  @override
  List<Object> get props => [message];
}