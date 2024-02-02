part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {
  @override
  String toString() {
    return 'UninitializedState';
  }
}

class Authenticated extends AuthState {
  const Authenticated({required this.phoneNo});

  final String phoneNo;

  @override
  String toString() {
    return 'AuthenticatedState';
  }
}

class UnAuthenticated extends AuthState {
  @override
  String toString() {
    return 'UnAuthenticatedState';
  }
}
