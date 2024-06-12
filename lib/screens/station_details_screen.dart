import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/models/charging_station_models.dart';
import 'package:ev_charging_app/screens/charging_screen.dart';
import 'package:flutter/material.dart';

class ChargingStationDetails extends StatelessWidget {
  final ChargingStation station;

  ChargingStationDetails({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff020819),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('ChargerID-001'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(station.imagePath,
                width: double.infinity, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                station.stationName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  station.location,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.watch_later_rounded, color: Colors.white),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Open • 24 hours',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.battery_charging_full_sharp,
                    color: Colors.white),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  station.type,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 23,
                  width: 86,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: station.status == 0
                        ? const Color(0xfff69E199)
                        : const Color(0xfffFFDF6E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      station.status == 0 ? "Available" : "Charging",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xfff061237),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${station.pricePerHour}/hour',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Divider(
              height: 1.0,
              color: Color(0xfff344054),
            ),
            const SizedBox(height: 16),
            const Text(
              'My Stats',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 114,
                    width: 155,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xfff1D2939),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '0 Sessions',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Sessions',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 114,
                    width: 155,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xfff1D2939),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '0.0 kWh',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Used',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 41),
            CustomButton(
              text: 'Charge here',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChargingScreen(
                      station: station,
                    ),
                  ),
                );
              },
              backgroundColor: Colors.white,
              buttonTextColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
