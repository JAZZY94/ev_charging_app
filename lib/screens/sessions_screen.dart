import 'package:flutter/material.dart';

class SessionsScreen extends StatelessWidget {
  final List<Session> sessions = [
    Session(
        location: 'Apart Hotel | 21kW',
        time: 'Today, 1:15 PM',
        duration: '30 min',
        energy: '8.12 kW'),
    Session(
        location: 'Glacis Charger 3',
        time: 'Today, 9:00 AM',
        duration: '30 min',
        energy: '8.12 kW'),
    Session(
        location: 'Hôtel de Ville',
        time: 'Today, 9:00 AM',
        duration: '30 min',
        energy: '8.12 kW'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff020819),
      appBar: AppBar(
        title: const Text('Sessions'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1D2939),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff344054),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Club Sessions',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff1D2939),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Guest Sessions',
                          style: TextStyle(color: Color(0xff667085)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListTile(
                      title: Text(sessions[index].location,
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text(sessions[index].time,
                          style: const TextStyle(color: Colors.grey)),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(sessions[index].energy,
                              style: const TextStyle(color: Colors.white)),
                          Text(sessions[index].duration,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      tileColor: const Color(0xfff020819),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Session {
  final String location;
  final String time;
  final String duration;
  final String energy;

  Session(
      {required this.location,
      required this.time,
      required this.duration,
      required this.energy});
}
