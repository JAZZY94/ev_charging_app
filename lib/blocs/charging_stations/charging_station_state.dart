import 'package:equatable/equatable.dart';

abstract class ChargingStationsState extends Equatable {
  const ChargingStationsState();

  @override
  List<Object> get props => [];
}

class ChargingStationsInitial extends ChargingStationsState {}

class ChargingStationsLoading extends ChargingStationsState {}

class ChargingStationsLoaded extends ChargingStationsState {
  final List<Map<String, dynamic>> chargingStations;

  const ChargingStationsLoaded(this.chargingStations);

  @override
  List<Object> get props => [chargingStations];
}

class ChargingStationsError extends ChargingStationsState {
  final String message;

  const ChargingStationsError(this.message);

  @override
  List<Object> get props => [message];
}
