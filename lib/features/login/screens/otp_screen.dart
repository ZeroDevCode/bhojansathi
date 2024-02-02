import 'dart:developer' as dev;

import 'package:bhojansathi/bloc/auth/auth_bloc.dart';
import 'package:bhojansathi/bloc/login/login_bloc.dart';
import 'package:bhojansathi/bloc/user/register/user_register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otp = "";
  String verificationId = "";
  final TextEditingController otpController = TextEditingController();
  late LogInBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LogInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                context.read<UserRegisterBloc>().add(GetUser(state.phoneNo));
              } else if (state is UnAuthenticated) {
                context.go('/login');
              }
            },
          ),
          BlocListener<UserRegisterBloc, UserRegisterState>(
            listener: (context, state) {
              if (state is UserRegistered) {
                context.go('/home');
              } else if (state is UserNotRegistered) {
                context.go('/user_register');
              } else if (state is GettingUser) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Please wait"),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/verification.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  length: 6,
                  controller: otpController,
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,

                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<LogInBloc, LogInState>(
                  bloc: _loginBloc,
                  listener: (context, state) {
                    if (state.isOtpVerified) {
                      // context.go('/home');
                      context.read<AuthBloc>().add(LoggedIn());
                      // Future.delayed(
                      //   const Duration(seconds: 0),
                      //   () {
                      //     final phoneNo = (context.read<AuthBloc>().state
                      //             as Authenticated)
                      //         .phoneNo;
                      //     context
                      //         .read<UserRegisterBloc>()
                      //         .add(GetUser(phoneNo));
                      //   },
                      // );
                    } else if (state.isOtpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Something went wrong ${state.error.toString()}",
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 223, 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () async {
                            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                            dev.log("OTP: $otp", name: "OTP");
                            dev.log(
                              "VerificationId: ${state.verificationId}",
                              name: "OTP",
                            );
                            try {
                              final AuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: state.verificationId.toString(),
                                smsCode: otpController.text,
                              );
                              dev.log("Hello", name: "OTP");
                              await firebaseAuth
                                  .signInWithCredential(credential);
                              // context.go("/home");
                              context.read<AuthBloc>().add(LoggedIn());
                            } catch (e) {
                              rethrow;
                            }
                          },
                          child: const Text(
                            "Verify Phone Number",
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
