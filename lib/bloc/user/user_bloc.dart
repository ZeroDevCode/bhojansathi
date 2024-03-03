import 'dart:async';

import 'package:bhojansathi/models/UserModel.dart';
import 'package:bhojansathi/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUserEvent);
    on<AddUserEvent>(_onAddUserEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
    on<DeleteUserEvent>(_onDeleteUserEvent);
  }

  final UserRepository _userRepository;
  StreamSubscription? _userSubscription;

  Future<void> _onLoadUserEvent(
      LoadUserEvent event, Emitter<UserState> emit) async {
    try {
      _userSubscription?.cancel();
      _userSubscription = _userRepository.getFoodDonationList().listen(
            (userList) => add(UpdateUserEvent(userModel: userList)),
          );
    } catch (e) {
      emit(UserErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddUserEvent(
      AddUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      await _userRepository.addUser(event.userModel);
      emit(UserOperationSucessState());
    } catch (e) {
      emit(UserErrorState(message: e.toString()));
    }
  }

  void _onUpdateUserEvent(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadedState(userList: event.userModel));
  }

  void _onDeleteUserEvent(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      await _userRepository
          .deleteUser(event.userId);
      emit(UserOperationSucessState());
    } catch (e) {
      emit(UserErrorState(message: e.toString()));
    }
  }

  @override
  void onTransition(Transition<UserEvent, UserState> transition) {
    dev.log(transition.toString(), name: 'User');
    super.onTransition(transition);
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
