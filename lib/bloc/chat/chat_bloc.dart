import 'dart:async';

import 'package:bhojansathi/models/ChatModel.dart';
import 'package:bhojansathi/repositories/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatInitialState()) {
    on<LoadChatEvent>(_onLoadChatListEvent);
    on<AddChatEvent>(_onAddChatEvent);
    on<UpdateChatEvent>(_onUpdateChatEvent);
  }

  final ChatRepository _chatRepository;
  StreamSubscription? _chatSubscription;

  Future<void> _onLoadChatListEvent(
      LoadChatEvent event, Emitter<ChatState> emit) async {
    _chatSubscription?.cancel();
    try {
      _chatSubscription = _chatRepository.getChats(event.senderId, event.receiverId).listen((list) {
        add(UpdateChatEvent(chatModel: list));
      });
    } catch (e) {
      emit(ChatErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddChatEvent(
      AddChatEvent event, Emitter<ChatState> emit) async {
    try {
      emit(ChatLoadingState());
      await _chatRepository.addChat(event.chatModel);
      emit(ChatOperationSucessState());
    } catch (e) {
      emit(ChatErrorState(message: e.toString()));
    }
  }

  void _onUpdateChatEvent(
      UpdateChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoadedState(chatList: event.chatModel));
  }
}
