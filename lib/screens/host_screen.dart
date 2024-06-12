import 'package:ev_charging_app/blocs/user/user_bloc.dart';
import 'package:ev_charging_app/blocs/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020819),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Text(
                'Welcome ${state.username} ✨',
                style: TextStyle(fontSize: 16),
              );
            } else {
              return Text(
                'Welcome User ✨',
                style: TextStyle(fontSize: 16),
              );
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '€158.00',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Available to spend',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Earnings this month',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const Text(
                    '€156.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Request Transfer'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transactions',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  buildTransactionItem('Charging Session', 'Today, 1:15 PM',
                      '€25.78', '8.12 kW'),
                  buildTransactionItem('Charging Session', 'Today, 9:00 AM',
                      '€150.00', '8.12 kW'),
                  buildTransactionItem('Charging Session', 'Today, 1:15 PM',
                      '€25.78', '8.12 kW'),
                  buildTransactionItem('Charging Session', 'Today, 9:00 AM',
                      '€150.00', '8.12 kW'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionItem(
      String title, String time, String amount, String power) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 4.0),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 4.0),
              Text(
                power,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
