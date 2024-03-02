part of 'login_bloc.dart';

abstract class LogInEvent extends Equatable{
  const LogInEvent();

  @override
  List<Object?> get props => [];
}

class SendOtpPressed extends LogInEvent{
  final String phoneNumber;

  const SendOtpPressed({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class OnPhoneOtpSent extends LogInEvent{
  final String verificationId;
  final int? forceResendingToken;

  const OnPhoneOtpSent({required this.verificationId, required this.forceResendingToken});

  @override
  List<Object?> get props => [verificationId, forceResendingToken];
}

class VerifyOtpEvent extends LogInEvent{
  final String verificationId;
  final String smsCode;

  const VerifyOtpEvent({required this.verificationId, required this.smsCode});

  @override
  List<Object?> get props => [verificationId, smsCode];
}

class OnPhoneAuthErrorEvent extends LogInEvent{
  final String error;

  const OnPhoneAuthErrorEvent(this.error);

  @override
  List<Object?> get props => [error];
}

class OnPhoneAuthSuccessEvent extends LogInEvent{
  const OnPhoneAuthSuccessEvent();

  @override
  List<Object?> get props => [];
}