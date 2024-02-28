import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/features/auth/screen/auth_screen.dart';
import 'package:bhojansathi/features/login/screens/login_screen.dart';
import 'package:bhojansathi/features/login/screens/otp_screen.dart';
import 'package:bhojansathi/features/login/screens/user_register_screen.dart';
import 'package:bhojansathi/features/login/screens/user_types.dart';
import 'package:bhojansathi/features/registration/screens/individual_screen.dart';
import 'package:bhojansathi/features/registration/screens/organization_screen.dart';
import 'package:bhojansathi/features/splash/screens/on_boarding.dart';
import 'package:bhojansathi/shell/base/screens/base_screen.dart';
import 'package:bhojansathi/shell/chat/screens/chat_list_screen.dart';
import 'package:bhojansathi/shell/donations/screens/donation_edit_screen.dart';
import 'package:bhojansathi/shell/donations/screens/new_donation_screen.dart';
import 'package:bhojansathi/shell/donations/screens/donation_history_screen.dart';
import 'package:bhojansathi/shell/home/screens/home_screen.dart';
import 'package:bhojansathi/shell/notification/screens/notification_screen.dart';
import 'package:bhojansathi/shell/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/splash/screens/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: RoutePaths.splashScreen,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.authScreen,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.otpScreen,
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.userRegisterScreen,
      builder: (context, state) => const UserRegistrationScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.onBoardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutePaths.userTypeScreen,
      builder: (context, state) => const UserTypeScreen(),
    ),
    GoRoute(
      path: RoutePaths.userRegisterScreen,
      builder: (context, state) => const UserRegistrationScreen(),
    ),
    GoRoute(
      path: RoutePaths.individualUserRegisterScreen,
      builder: (context, state) => const IndividualUserRegisterScreen(),
    ),
    GoRoute(
      path: RoutePaths.organizationProfileCreateScreen,
      builder: (context, state) => const OrganizationProfileCreateScreen(),
    ),
    GoRoute(
      path: RoutePaths.profileMyDonationScreen,
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: RoutePaths.newDonationScreen,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: NewDonationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
    GoRoute(
      path: '${RoutePaths.editDonationScreen}/:id',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: DonationEditScreen(donationId: state.pathParameters['id']!),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        child,
      ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BaseScreen(child: child);
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: RoutePaths.baseScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: RoutePaths.chatScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Chat(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: RoutePaths.notificationScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const NotificationJ(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: RoutePaths.profileScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
          ),
        ),
        GoRoute(
          path: RoutePaths.historyScreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HistoryScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
      ],
    ),
  ],
);
