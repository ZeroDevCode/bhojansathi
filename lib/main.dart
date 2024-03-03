import 'package:bhojansathi/bloc/auth/auth_bloc.dart';
import 'package:bhojansathi/bloc/chat/chat_list/chat_list_bloc.dart';
import 'package:bhojansathi/bloc/donation/donation_bloc.dart';
import 'package:bhojansathi/bloc/login/login_bloc.dart';
import 'package:bhojansathi/bloc/organization/organization_bloc.dart';
import 'package:bhojansathi/bloc/user/user_bloc.dart';
import 'package:bhojansathi/config/router.dart';
import 'package:bhojansathi/repositories/auth_repository.dart';
import 'package:bhojansathi/repositories/chat_repository.dart';
import 'package:bhojansathi/repositories/donation_repository.dart';
import 'package:bhojansathi/repositories/organization_repository.dart';
import 'package:bhojansathi/repositories/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepository: UserRepository())
            ..add(LoadUserEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: AuthRepository())..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => LogInBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) =>
              FoodDonationBloc(donationRepository: DonationRepository()),
        ),
        BlocProvider(
          create: (context) => ChatListBloc(chatRepository: ChatRepository()),
        ),
        BlocProvider(
          create: (context) => OrganizationBloc(
              organizationRepository: OrganizationRepository()),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            elevation: 2,
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        routerConfig: router,
      ),
    );
  }
}
