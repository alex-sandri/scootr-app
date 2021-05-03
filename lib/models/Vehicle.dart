import 'package:scootr/models/Location.dart';

class Vehicle {
  final String id;
  final int batteryLevel;
  final Location location;

  const Vehicle({
    required this.id,
    required this.batteryLevel,
    required this.location,
  });

  static Vehicle deserialize(Map<String, dynamic> json) {
    return Vehicle(
      id: json["id"],
      batteryLevel: json["battery_level"],
      location: Location.deserialize(json["location"]),
    );
  }
}
