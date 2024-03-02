part of 'login_bloc.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object?> get props => [];
}

class LogInStateInitial extends LogInState {
}

class LogInStateLoading extends LogInState {
  const LogInStateLoading();
}

class LogInStateOtpSent extends LogInState {
  final String verificationId;
  final int? forceResendingToken;

  const LogInStateOtpSent({
    required this.verificationId,
    required this.forceResendingToken,
  });

  @override
  List<Object?> get props => [verificationId, forceResendingToken];
}

class LogInStateFailure extends LogInState {
  final String error;

  const LogInStateFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

class LogInStateSuccess extends LogInState {
  final String phoneNumber;
  final String userId;

  const LogInStateSuccess(this.phoneNumber, this.userId);

  @override
  List<Object?> get props => [phoneNumber, userId];
}

class LogInStateEmpty extends LogInState {
  const LogInStateEmpty();
}
