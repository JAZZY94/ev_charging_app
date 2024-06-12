import 'package:equatable/equatable.dart';

abstract class ChargingStationsEvent extends Equatable {
  const ChargingStationsEvent();

  @override
  List<Object> get props => [];
}

class LoadChargingStations extends ChargingStationsEvent {}
