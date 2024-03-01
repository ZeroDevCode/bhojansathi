import 'dart:async';

import 'package:bhojansathi/bloc/chat/chat_bloc.dart';
import 'package:bhojansathi/models/ChatListModel.dart';
import 'package:bhojansathi/repositories/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_list_event.dart';

part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatListInitialState()) {
    on<LoadChatListEvent>(_onLoadChatListEvent);
    on<AddChatListEvent>(_onAddChatListEvent);
    on<UpdateChatListEvent>(_onUpdateChatListEvent);

  }

  final ChatRepository _chatRepository;
  StreamSubscription? _chatListSubscription;

  Future<void> _onLoadChatListEvent(
      LoadChatListEvent event, Emitter<ChatListState> emit) async {
    _chatListSubscription?.cancel();
    try {
      _chatListSubscription = _chatRepository.getListOfChats(event.userId).listen((list) {
        add(UpdateChatListEvent(chatListModel: list));
      });
    } catch (e) {
      emit(ChatListErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddChatListEvent(
      AddChatListEvent event, Emitter<ChatListState> emit) async {
    try {
      emit(ChatListLoadingState());
      await _chatRepository.addChatList(event.chatListModel);
      emit(ChatListOperationSucessState());
    } catch (e) {
      emit(ChatListErrorState(message: e.toString()));
    }
  }

  void _onUpdateChatListEvent(
      UpdateChatListEvent event, Emitter<ChatListState> emit) async {
    emit(ChatListLoadedState(chatList: event.chatListModel));
  }


}
