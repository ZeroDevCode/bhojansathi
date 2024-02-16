import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isNewUser();
    super.initState();
  }

  void isNewUser()async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isNewUser = sp.getBool('isNewUser') ?? false;

    if(true){
      Timer(const Duration(seconds: 3), () {
        context.go('/onboarding_screen');
      });

    }else{
      Timer(const Duration(seconds: 5), () {
        context.go('/auth_screen');
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            FlutterLogo(size: 100,)
          ],
        ),
      ),
    );
  }
}
