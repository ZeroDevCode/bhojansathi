import 'dart:developer' as dev;

import 'package:bhojansathi/bloc/auth/auth_bloc.dart';
import 'package:bhojansathi/bloc/user/user_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Uninitialized) {
              dev.log("1", name: "AuthBloc");
            } else if (state is UnAuthenticated) {
              dev.log("2", name: "AuthBloc");
              context.go(RoutePaths.onBoardingScreen);
            } else if (state is Authenticated) {
              dev.log("3", name: "AuthBloc");
              context.go(RoutePaths.baseScreen);
            } else {
              dev.log("4", name: "AuthBloc");
              context.go(RoutePaths.loginScreen);
            }
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text('Please wait'),
            ],
          ),
        ),
      ),
    );
  }

}
