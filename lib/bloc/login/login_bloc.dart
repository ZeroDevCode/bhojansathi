import 'dart:async';
import 'dart:developer' as dev;

import 'package:bhojansathi/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LogInState.empty()) {
    on<SendOtpPressed>(_onSendOtpPressed);
    on<OnPhoneOtpSent>(_onPhoneOtpSent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
    on<OnPhoneAuthErrorEvent>(_onPhoneAuthErrorEvent);
    on<OnPhoneAuthSuccessEvent>(_onPhoneAuthSuccessEvent);
  }

  final AuthRepository _authRepository;

  Future<void> _onSendOtpPressed(
      SendOtpPressed event, Emitter<LogInState> emit) async {
    try {
      emit(LogInState.loading());
      await _authRepository.loginWithPhone(
        phoneNumber: event.phoneNumber,
        onVerificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          add(OnPhoneAuthSuccessEvent());
        },
        onVerificationFailed: (FirebaseAuthException firebaseAuthException) {
          add(OnPhoneAuthErrorEvent(firebaseAuthException.message ?? ''));
        },
        onCodeSent: (String verificationId, int? forceResendingToken) {
          add(OnPhoneOtpSent(
              verificationId: verificationId,
              forceResendingToken: forceResendingToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // emit(state.copyWith(
          //   isOtpSent: true,
          //   verificationId: verificationId,
          // ));
        },
      );
    } catch (_) {
      emit(LogInState.failure(_.toString()));
    }
  }

  Future<void> _onPhoneOtpSent(
      OnPhoneOtpSent event, Emitter<LogInState> emit) async {
    emit(state.copyWith(
      isOtpSent: true,
      verificationId: event.verificationId,
      forceResendingToken: event.forceResendingToken,
    ));
  }

  Future<void> _onVerifyOtpEvent(
      VerifyOtpEvent event, Emitter<LogInState> emit) async {
    try {
      _authRepository.signInWithOTP(event.verificationId, event.smsCode);
      emit(LogInState.success());
    } catch (e) {
      emit(LogInState.failure(e.toString()));
    }
  }

  Future<void> _onPhoneAuthErrorEvent(
      OnPhoneAuthErrorEvent event, Emitter<LogInState> emit) async {
    emit(LogInState.failure(event.error));
  }

  Future<void> _onPhoneAuthSuccessEvent(
      OnPhoneAuthSuccessEvent event, Emitter<LogInState> emit) async {
    emit(LogInState.success());
  }

  @override
  void onTransition(Transition<LogInEvent, LogInState> transition) {
    dev.log(transition.toString(), name: 'Login');
    super.onTransition(transition);
  }
}
