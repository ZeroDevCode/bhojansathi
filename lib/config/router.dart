import 'package:bhojansathi/features/auth/screen/auth_screen.dart';
import 'package:bhojansathi/features/home/home_screen.dart';
import 'package:bhojansathi/features/login/screens/login_screen.dart';
import 'package:bhojansathi/features/login/screens/otp_screen.dart';
import 'package:bhojansathi/features/login/screens/user_register_screen.dart';
import 'package:bhojansathi/features/login/screens/user_types.dart';
import 'package:bhojansathi/features/splash/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/splash/screens/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/splash_screen',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/auth_screen',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login_screen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/otp_screen',
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/user_register_screen',
      builder: (context, state) => const UserRegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/home_screen',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/splash_screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/onboarding_screen',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/user_type_screen',
      builder: (context, state) => const UserTypeScreen(),
    )
  ],
);
