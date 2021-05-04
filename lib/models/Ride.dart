import 'package:scootr/models/Vehicle.dart';
import 'package:scootr/models/Wallet.dart';

class Ride {
  final String id;
  final Vehicle vehicle;
  final Wallet wallet;
  final DateTime startTime;
  final DateTime? endTime;
  final num? amount;

  const Ride({
    required this.id,
    required this.vehicle,
    required this.wallet,
    required this.startTime,
    this.endTime,
    this.amount,
  });

  Ride.deserialize(Map<String, dynamic> json): this(
    id: json["id"],
    vehicle: Vehicle.deserialize(json["vehicle"]),
    wallet: Wallet.deserialize(json["wallet"]),
    startTime: DateTime.parse(json["start_time"]),
    endTime: json["end_time"] != null
      ? DateTime.parse(json["end_time"])
      : null,
    amount: json["amount"] != null
      ? json["amount"]
      : null,
  );
}
