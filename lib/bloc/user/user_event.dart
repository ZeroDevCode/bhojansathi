part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  final UserModel userModel;

  const AddUserEvent({required this.userModel});
}

class UpdateUserEvent extends UserEvent {
  final List<UserModel> userModel;

  const UpdateUserEvent({required this.userModel});
}

class DeleteUserEvent extends UserEvent {
  final String userId;

  const DeleteUserEvent({required this.userId});
}
