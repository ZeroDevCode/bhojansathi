import 'package:bhojansathi/cubits/auth_cubit/auth_cubit.dart';
import 'package:bhojansathi/cubits/auth_cubit/auth_state.dart';
import 'package:bhojansathi/features/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Image.asset('assets/images/verification.png'),
          ),
          const SizedBox(height: 10),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOutState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logout();
                  },
                  child: const Text("Log out"));
            },
          )
        ],
      ),
    );
  }
}
