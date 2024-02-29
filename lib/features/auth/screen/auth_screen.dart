import 'dart:developer' as dev;

import 'package:bhojansathi/bloc/auth/auth_bloc.dart';
import 'package:bhojansathi/bloc/user/register/user_register_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Uninitialized) {
            } else if (state is UnAuthenticated) {
              dev.log('UnAuthenticated', name: 'Auth');
              context.go(RoutePaths.onBoardingScreen);
            } else if (state is Authenticated) {
              dev.log('Authenticated', name: 'Auth');
              context.read<UserRegisterBloc>().add(GetUser(state.phoneNo));
            } else {
              dev.log('Error', name: 'Auth');
              context.go(RoutePaths.loginScreen);
            }
          },
        ),
        BlocListener<UserRegisterBloc, UserRegisterState>(
          listener: (context, state) {
            if (state is UserRegistered) {
              context.go(RoutePaths.userTypeScreen);
              dev.log("UserRegistered", name: "UserRegistered");
            } else if (state is UserNotRegistered) {
              dev.log("UserNotRegistered", name: "UserNotRegistered");
              context.go(RoutePaths.userTypeScreen);
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
              context.go(RoutePaths.baseScreen);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/verification.png'),
              const SizedBox(height: 5),
              const CircularProgressIndicator(),
              const Text('Please wait'),
            ],
          ),
        ),
      ),
    );
  }
}
