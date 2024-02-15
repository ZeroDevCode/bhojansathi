import 'package:bhojansathi/bloc/auth/auth_bloc.dart';
import 'package:bhojansathi/bloc/login/login_bloc.dart';
import 'package:bhojansathi/bloc/user/register/user_register_bloc.dart';
import 'package:bhojansathi/utils/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNoController = TextEditingController();
  late LogInBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LogInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/registration.png',
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
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "+91",
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _mobileNoController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          counterText: "",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state.isOtpSent) {
                    context.go('/otpScreen');
                    if (kDebugMode) {
                      print(state.verificationId);
                    }
                  } else if (state.isOtpError) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Something went wrong ${state.error.toString()}",
                        ),
                      ),
                    );
                  } else if (state.isSubmitting) {
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
                              Text("Sending OTP"),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state.isOtpVerified) {
                    context.read<AuthBloc>().add(LoggedIn());
                    Future.delayed(
                      const Duration(seconds: 0),
                      () {
                        final phoneNo =
                            (context.read<AuthBloc>().state as Authenticated)
                                .phoneNo;
                        context.read<UserRegisterBloc>().add(GetUser(phoneNo));
                      },
                    );
                  }
                },
                child: BlocBuilder<LogInBloc, LogInState>(
                  bloc: _loginBloc,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _onLoginPressed();
                        },
                        child: const Text(
                          "Verify",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    if (Validators.isValidMobileNo(_mobileNoController.text)) {
      _loginBloc.add(SendOtpPressed(phoneNumber: _mobileNoController.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter a valid mobile number",
          ),
        ),
      );
    }
  }
}
