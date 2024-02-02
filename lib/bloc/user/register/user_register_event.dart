part of 'user_register_bloc.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object?> get props => [];
}

class InitializeUser extends UserRegisterEvent {}

class RegisterUser extends UserRegisterEvent {
  const RegisterUser(this.user);

  final UserModel user;
}

class UnRegisterUser extends UserRegisterEvent {}

class GetUser extends UserRegisterEvent {
  const GetUser(this.userId);

  final String userId;
}

class UpdateUser extends UserRegisterEvent {
  const UpdateUser({required this.user});

  final UserModel user;
}
