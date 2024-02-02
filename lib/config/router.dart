import 'package:bhojansathi/features/auth/screen/auth_screen.dart';
import 'package:bhojansathi/features/home/home_screen.dart';
import 'package:bhojansathi/features/login/screens/login_screen.dart';
import 'package:bhojansathi/features/login/screens/otp_screen.dart';
import 'package:bhojansathi/features/login/screens/user_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/auth',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/otpScreen',
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/user_register',
      builder: (context, state) => const UserRegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
