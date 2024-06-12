import 'package:ev_charging_app/custom_widgets/button.dart';
import 'package:ev_charging_app/models/charging_station_models.dart';
import 'package:ev_charging_app/screens/invoice_screen.dart';
import 'package:flutter/material.dart';

class ChargingScreen extends StatelessWidget {
  final ChargingStation station;

  const ChargingScreen({super.key, required this.station});

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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 5),
              child: SizedBox(
                height: 99,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Charging',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.rotate(
                                angle: 1.5708,
                                child: const Icon(Icons.battery_0_bar_sharp,
                                    size: 34, color: Colors.grey)),
                            const SizedBox(
                              width: 7,
                            ),
                            const Icon(
                              Icons.bolt_rounded,
                              color: Colors.green,
                              size: 34,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text('00%',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green)),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text('0h 0m remain',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/photo (2).png')
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1.0,
              color: Color(0xfff344054),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: SizedBox(
                  height: 88,
                  child: Text(
                    '00.00 kWh',
                    style: TextStyle(
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 1.0,
              color: Color(0xfff344054),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  station.stationName,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  '€ 00.00/kWh',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
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
                Icon(Icons.battery_charging_full_rounded, color: Colors.white),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'CCS2 • 21kW',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              height: 1.0,
              color: Color(0xfff344054),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Charging cost',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('€ 00.00',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Idle Fee',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('€ 00.00',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text('€ 00.00',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Stop charging',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InvoiceScreen()),
                );
              },
              backgroundColor: Colors.white,
              buttonTextColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
