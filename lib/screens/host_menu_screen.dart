import 'package:ev_charging_app/blocs/user/user_bloc.dart';
import 'package:ev_charging_app/blocs/user/user_state.dart';
import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/screens/account_settings.dart';
import 'package:ev_charging_app/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HostMenuScreen extends StatefulWidget {
  const HostMenuScreen({super.key});

  @override
  State<HostMenuScreen> createState() => _HostMenuScreenState();
}

class _HostMenuScreenState extends State<HostMenuScreen> {
  Future<void> _logout(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff020819),
      appBar: AppBar(
        title: const Text('Host menu'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [const Icon(Icons.notifications_outlined)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              width: 357,
              height: 106,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xfff1D2939),
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/Avatar.png'),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.username,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffF9FAFB),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              state.email,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff667085),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 25,
                          width: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              'Host',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'General',
              style: TextStyle(fontSize: 14, color: Color(0xfff98A2B3)),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Container(
              width: 357,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xfff1D2939),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AccountSettingsScreen()),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.person,
                              size: 24, color: Color(0xfffEAECF0)), // User icon
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Account Settings',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xfffEAECF0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 1.0,
                    color: Color(0xfff667085),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.local_gas_station_outlined,
                            color: Color(0xfffEAECF0), size: 24), // User icon
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'My Chargers',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Color(0xfffEAECF0)), // Arrow icon
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Support',
              style: TextStyle(fontSize: 14, color: Color(0xfff98A2B3)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 357,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xfff1D2939),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.help_outline_outlined, size: 24),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Help',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xfffEAECF0)),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 62,
          ),
          CustomButton(
            text: 'Switch to EV user',
            onPressed: () {},
            icon: Icons.transform_outlined,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Logout',
            onPressed: () {
              _logout(context);
            },
            icon: Icons.logout_outlined,
            iconColor: Colors.black,
            backgroundColor: Colors.white,
            buttonTextColor: Colors.black,
          )
        ],
      ),
    );
  }
}
