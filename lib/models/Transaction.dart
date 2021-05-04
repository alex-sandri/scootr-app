import 'package:scootr/models/Wallet.dart';

class Transaction {
  final String id;
  final num amount;
  final Wallet wallet;
  final DateTime timestamp;
  final String reason;
  final String externalId;

  const Transaction({
    required this.id,
    required this.amount,
    required this.wallet,
    required this.timestamp,
    required this.reason,
    required this.externalId,
  });

  Transaction.deserialize(Map<String, dynamic> json): this(
    id: json["id"],
    amount: json["amount"],
    wallet: Wallet.deserialize(json["wallet"]),
    timestamp: DateTime.parse(json["timestamp"]),
    reason: json["reason"],
    externalId: json["external_id"],
  );
}
