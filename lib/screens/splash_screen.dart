import 'package:ev_charging_app/blocs/splash/splash_bloc.dart';
import 'package:ev_charging_app/blocs/splash/splash_event.dart';
import 'package:ev_charging_app/blocs/splash/splash_state.dart';
import 'package:ev_charging_app/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'my_home_page.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(FirebaseAuth.instance),
        ),
        BlocProvider(
          create: (context) => SplashBloc(
            firebaseAuth: FirebaseAuth.instance,
            userBloc: context.read<UserBloc>(),
          )..add(StartSplash()),
        ),
      ],
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          } else if (state is Unauthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xfff020819),
          body: Center(
            child:
                Image.asset('assets/Group 38086.png', width: double.infinity),
          ),
        ),
      ),
    );
  }
}
