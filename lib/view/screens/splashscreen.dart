import 'dart:async';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:doctors_book_app/controller/authentication/bloc/auth_bloc.dart';
import 'package:doctors_book_app/view/screens/Onboardign_screen.dart';
import 'package:doctors_book_app/view/screens/bottomnaigation.dart';
import 'package:doctors_book_app/view/screens/doctorsdetails_screen.dart';
import 'package:doctors_book_app/view/screens/homepage/home_screen.dart';
import 'package:doctors_book_app/view/screens/settings_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckLoginStatusEvent()),
      child: Splashscreen(),
    );
  }
}

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        Timer(const Duration(seconds: 3), () {
          // user != null
          //     ? Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (_) => settingsScreenWrapper()))
          //     : Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (_) => OnboardingWrapper()));
          if (state is Authenticated) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const BottomNavigationWrapper()));
          } else if (state is UnAuthenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const OnboardingWrapper()));
          }
        });
      },
      child: FlutterSplashScreen.fadeIn(
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.white,
        childWidget: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Image.asset("assets/image-removebg-preview.png"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "MEDICO",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                ),
                const Text(
                  "YOUR MEDICAL CAMPANION",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
