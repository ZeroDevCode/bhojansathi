import 'dart:developer' as dev;

import 'package:bhojansathi/bloc/login/login_bloc.dart';
import 'package:bhojansathi/bloc/user/user_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();
  late LogInBloc _loginBloc;
  String verificationId = "";
  @override
  void initState() {
    super.initState();
    verificationId = widget.verificationId;
    _loginBloc = BlocProvider.of<LogInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogInStateLoading) {}
          if (state is LogInStateSuccess) {
            Navigator.pop(context);
            Helper.scaffoldMessenger(
                "LoginSuccess ${state.phoneNumber}", context);
            context.go(RoutePaths.baseScreen);
          }
          if (state is LogInStateFailure) {
            Navigator.pop(context);
            Helper.scaffoldMessenger(state.error, context);
          }
        },
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
                Text(
                  "OTP Verification",
                  style: MyStyle.textHeadingStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the 6 digit OTP sent to your mobile number",
                  style: MyStyle.textSubHeadingStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Pinput(
                  length: 6,
                  controller: otpController,
                  showCursor: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<LogInBloc, LogInState>(
                  bloc: _loginBloc,
                  listener: (context, state) {
                    if (state is LogInStateSuccess) {
                      BlocProvider.of<UserBloc>(context).add(LoadUserEvent());
                      BlocListener<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is UserLoadedState) {
                            final users = state.userList.where((element) => element.id == FirebaseAuth.instance.currentUser!.uid);
                            if(users.isNotEmpty){
                             context.go(RoutePaths.baseScreen);
                            } else {
                              context.go(RoutePaths.userRegisterScreen);
                            }
                          }
                        },
                        child: Container(),
                      );
                    } else if (state is LogInStateFailure) {

                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: MyStyle.buttonStyle.copyWith(
                        fixedSize: MaterialStateProperty.all(
                          const Size(150, 50),
                        ),
                      ),
                      onPressed: () async {
                        if (otpController.text.isNotEmpty) {
                          showDialogOfOptSend(context);
                          BlocProvider.of<LogInBloc>(context).add(
                              VerifyOtpEvent(
                                  verificationId: verificationId,
                                  smsCode: otpController.text));
                        } else {
                          Helper.scaffoldMessenger(
                              "Please enter the OTP", context);
                        }
                      },
                      child: Text(
                        "Verify",
                        style: MyStyle.primaryButtonTextStyle,
                      ),
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

  void showDialogOfOptSend(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (context) {
        return const AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Verifying OTP...'),
            ],
          ),
        );
      },
    );
  }
}
