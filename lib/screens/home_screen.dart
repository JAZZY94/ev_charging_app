import 'package:ev_charging_app/blocs/user/user_bloc.dart';
import 'package:ev_charging_app/blocs/user/user_state.dart';
import 'package:ev_charging_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80.0), // Set your desired height here
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoaded) {
                return Text(
                  'Welcome ${state.username} ✨',
                  style: const TextStyle(fontSize: 16),
                );
              } else {
                return const Text(
                  'Welcome ✨',
                  style: TextStyle(fontSize: 16),
                );
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: 102,
              width: 400,
              decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hôtel de Ville',
                        style: AppTextStyles.containerTextStyle,
                      ),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Pl. de l\'Hôtel de Ville, Paris • 1.4 km',
                    style: AppTextStyles.containerSubtitleTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Type 2 • 30kW',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      SizedBox(
                        width: 70.0,
                        height: 22.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xffFFDF6E), // Background color
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          child: const Text('Charging',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 54.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInfoCard('53', 'Sessions'),
              buildInfoCard('12 Kg', 'Co2 Saved'),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInfoCard('\$ 20', 'Charge Miles'),
              buildInfoCard('€ 120', 'Earnings'),
            ],
          ),
        ],
      ),
      //
    );
  }

  Widget buildInfoCard(String value, String label) {
    return Container(
      width: 155.0,
      height: 114.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff1D2939),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 18.0)),
          const SizedBox(height: 32.0),
          Text(label,
              style: const TextStyle(color: Colors.white54, fontSize: 14.0)),
        ],
      ),
    );
  }
}
