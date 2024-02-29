part of 'user_register_bloc.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();

  @override
  List<Object> get props => [];
}

class UserRegisterInitial extends UserRegisterState {}

class UserLoadingState extends UserRegisterState {}

class UserLoadedState extends UserRegisterState {
  final UserModel user;

  const UserLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}

class UserRegistering extends UserRegisterState {}

class UserRegistered extends UserRegisterState {
  const UserRegistered(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserNotRegistered extends UserRegisterState {}

class UserUpdated extends UserRegisterState {}

class GettingUser extends UserRegisterState {}

class UserError extends UserRegisterState {
  const UserError(this.message);

  final String message;
}

class UserRegisterError extends UserRegisterState {
  const UserRegisterError(this.message);

  final String message;
}