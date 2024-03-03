import 'package:bhojansathi/bloc/login/login_bloc.dart';
import 'package:bhojansathi/config/routePaths.dart';
import 'package:bhojansathi/generated/assets.dart';
import 'package:bhojansathi/utils/helper.dart';
import 'package:bhojansathi/utils/style.dart';
import 'package:bhojansathi/utils/validators.dart';
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
      body: BlocListener<LogInBloc, LogInState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LogInStateOtpSent) {
            Helper.scaffoldMessenger("Opt Send", context);
            Navigator.pop(context);
            context.go(RoutePaths.otpScreen
                .replaceAll(":verificationId", state.verificationId));
          }
          if (state is LogInStateFailure) {
            Helper.scaffoldMessenger(state.error, context);
          }
          if (state is LogInStateLoading) {
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
                      Text('Sending OTP...'),
                    ],
                  ),
                );
              },
            );
          }
        },
        child: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    Assets.imagesRegistration,
                    height: 200,
                  ),
                  Text(
                    'Phone Verification',
                    style: MyStyle.textHeadingStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'We will send you an OTP to verify your phone number',
                    style: MyStyle.textSubHeadingStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _mobileNoController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      labelText: 'Mobile Number',
                      hintText: 'Enter your mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixText: '+91 ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your mobile number';
                      } else if (!Validators.isValidMobileNo(value)) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: MyStyle.buttonStyle.copyWith(
                      fixedSize: MaterialStateProperty.all(
                        const Size(150, 50),
                      ),
                    ),
                    onPressed: () {
                      if (Validators.isValidMobileNo(
                          _mobileNoController.text)) {
                        _loginBloc.add(
                          SendOtpPressed(phoneNumber: _mobileNoController.text),
                        );
                      } else {
                        Helper.scaffoldMessenger(
                            'Please enter valid mobile number', context);
                      }
                    },
                    child: Text(
                      'Send OTP',
                      style: MyStyle.primaryButtonTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
