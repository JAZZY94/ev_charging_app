class ChargingStation {
  final String stationName;
  final String type;
  final String pricePerHour;
  final int status;
  final String imagePath;
  final String location;

  ChargingStation({
    required this.stationName,
    required this.type,
    required this.pricePerHour,
    required this.status,
    required this.imagePath,
    required this.location,
  });
}
