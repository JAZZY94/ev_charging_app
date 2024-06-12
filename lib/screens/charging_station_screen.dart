import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_charging_app/blocs/charging_stations/charging_station_bloc.dart';
import 'package:ev_charging_app/blocs/charging_stations/charging_station_event.dart';
import 'package:ev_charging_app/blocs/charging_stations/charging_station_state.dart';
import 'package:ev_charging_app/models/charging_station_models.dart';
import 'package:ev_charging_app/screens/station_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChargersScreen extends StatelessWidget {
  const ChargersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChargingStationsBloc(firestore: FirebaseFirestore.instance)
            ..add(LoadChargingStations()),
      child: Scaffold(
        backgroundColor: const Color(0xfff020819),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text('My Chargers', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChargingStationsBloc, ChargingStationsState>(
                  builder: (context, state) {
                    if (state is ChargingStationsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ChargingStationsLoaded) {
                      return ListView.builder(
                        itemCount: state.chargingStations.length,
                        itemBuilder: (context, index) {
                          final station = state.chargingStations[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ChargerTile(
                              imagePath: station['imagePath'],
                              name: station['stationName'],
                              location: station['address'],
                              price: station['priceperhour'],
                              type: station['type'],
                              status: station['chargingStatus'] == 0
                                  ? "Available"
                                  : "Charging",
                              statusColor: station['chargingStatus'] == 0
                                  ? Colors.green
                                  : Colors.yellow,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChargingStationDetails(
                                      station: ChargingStation(
                                        stationName: station['stationName'],
                                        type: station['type'],
                                        pricePerHour: station['priceperhour'],
                                        status: station['chargingStatus'],
                                        imagePath: 'assets/Img.png',
                                        location: station['address'],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is ChargingStationsError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(child: Text('Something went wrong!'));
                    }
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Add New Charger'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChargerTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String price;
  final String type;
  final String status;
  final Color statusColor;
  final void Function()? onTap;

  ChargerTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.price,
    required this.type,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 122,
        width: 327,
        decoration: BoxDecoration(
          color: const Color(0xFFF1D2939),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 91, height: 122, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(location,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white70)),
                    const SizedBox(height: 4),
                    Text(price,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(type,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white70)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
