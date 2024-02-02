part of 'login_bloc.dart';

class LogInState {
  final bool isPhoneValid;
  final bool isSubmitting;

  final bool isOtpSent;
  final bool isOtpVerified;
  final bool isOtpError;

  final String? verificationId;
  final int? forceResendingToken;
  final String? error;

  const LogInState({
    required this.isPhoneValid,
    required this.isSubmitting,
    required this.isOtpSent,
    required this.isOtpVerified,
    required this.isOtpError,
    required this.verificationId,
    required this.forceResendingToken,
    required this.error,
  });

  factory LogInState.empty() {
    return const LogInState(
      isPhoneValid: false,
      isSubmitting: false,
      isOtpSent: false,
      isOtpVerified: false,
      isOtpError: false,
      verificationId: null,
      forceResendingToken: null,
      error: null,
    );
  }

  factory LogInState.loading() {
    return const LogInState(
      isPhoneValid: true,
      isSubmitting: true,
      isOtpSent: false,
      isOtpVerified: false,
      isOtpError: false,
      verificationId: null,
      forceResendingToken: null,
      error: null,
    );
  }

  factory LogInState.failure(String error) {
    return LogInState(
      isPhoneValid: true,
      isSubmitting: false,
      isOtpSent: false,
      isOtpVerified: false,
      isOtpError: true,
      verificationId: null,
      forceResendingToken: null,
      error: error,
    );
  }

  factory LogInState.success() {
    return const LogInState(
      isPhoneValid: true,
      isSubmitting: false,
      isOtpSent: false,
      isOtpVerified: true,
      isOtpError: false,
      verificationId: null,
      forceResendingToken: null,
      error: null,
    );
  }

  LogInState update({
    bool? isPhoneValid,
    bool? isSubmitting,
    bool? isOtpSent,
    bool? isOtpVerified,
    bool? isOtpError,
    String? verificationId,
    int? forceResendingToken,
    String? error,
  }) {
    return copyWith(
      isPhoneValid: isPhoneValid,
      isSubmitting: isSubmitting,
      isOtpSent: isOtpSent,
      isOtpVerified: isOtpVerified,
      isOtpError: isOtpError,
      verificationId: verificationId,
      forceResendingToken: forceResendingToken,
      error: error,
    );
  }

  LogInState copyWith({
    bool? isPhoneValid,
    bool? isSubmitting,
    bool? isOtpSent,
    bool? isOtpVerified,
    bool? isOtpError,
    String? verificationId,
    int? forceResendingToken,
    String? error,
  }) {
    return LogInState(
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isOtpSent: isOtpSent ?? this.isOtpSent,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      isOtpError: isOtpError ?? this.isOtpError,
      verificationId: verificationId ?? this.verificationId,
      forceResendingToken: forceResendingToken ?? this.forceResendingToken,
      error: error ?? this.error,
    );
  }
}
