part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}


class UserLoadedState extends UserState {
  final List<UserModel> userList;

  const UserLoadedState({required this.userList});

  @override
  List<Object> get props => [userList];
}

class UserOperationSucessState extends UserState {}

class UserErrorState extends UserState {
  final String message;

  const UserErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
