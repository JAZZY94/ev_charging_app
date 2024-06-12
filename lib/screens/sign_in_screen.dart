import 'package:ev_charging_app/blocs/auth/auth_event.dart';
import 'package:ev_charging_app/blocs/auth/auth_state.dart';
import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/blocs/auth/auth_bloc.dart';
import 'package:ev_charging_app/custom_widgets/google_button.dart';
import 'package:ev_charging_app/screens/account_settings.dart';
import 'package:ev_charging_app/screens/home_screen.dart';
import 'package:ev_charging_app/screens/host_screen.dart';
import 'package:ev_charging_app/screens/host_selection_screen.dart';
import 'package:ev_charging_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocProvider(
        create: (context) => AuthBloc(
          firebaseAuth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 68,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: Image.asset('assets/Header.png', width: double.infinity),
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffF9FAFB)),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Enter your registered account to sign in',
                  style: AppTextStyles.subtitleTextStyle,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  'assets/Frame 96.png',
                ),
              ),
              const SizedBox(height: 58),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HostSelectionScreen()),
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: [
                      // CustomButton(
                      //   text: 'Continue with Google',
                      //   onPressed: () {
                      //     context.read<AuthBloc>().add(GoogleSignInRequested());
                      //   },
                      // ),
                      ContinueWithGoogleButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(GoogleSignInRequested());
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Register with email',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HostScreen();
                          }));
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 36),
              const Center(
                child: Text(
                  'By starting my application, I agree to El-Monde’s',
                  style: AppTextStyles.smallTextStyle,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Terms of Service and Privacy Policy',
                  style: AppTextStyles.smallTextStyleWhite,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 5,
                  width: 148,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
