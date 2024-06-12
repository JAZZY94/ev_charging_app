import 'package:ev_charging_app/blocs/charging_stations/charging_station_event.dart';
import 'package:ev_charging_app/blocs/charging_stations/charging_station_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChargingStationsBloc
    extends Bloc<ChargingStationsEvent, ChargingStationsState> {
  final FirebaseFirestore _firestore;

  ChargingStationsBloc({required FirebaseFirestore firestore})
      : _firestore = firestore,
        super(ChargingStationsInitial()) {
    on<LoadChargingStations>(_onLoadChargingStations);
  }

  Future<void> _onLoadChargingStations(
      LoadChargingStations event, Emitter<ChargingStationsState> emit) async {
    emit(ChargingStationsLoading());
    try {
      final snapshot = await _firestore.collection('charging_stations').get();
      final chargingStations = snapshot.docs.map((doc) => doc.data()).toList();
      emit(ChargingStationsLoaded(chargingStations));
    } catch (e) {
      emit(ChargingStationsError(e.toString()));
    }
  }
}
