import 'package:scootr/models/Wallet.dart';

class Subscription {
  final String id;
  final num amount;
  final Wallet wallet;
  final String status;
  final DateTime currentPeriodEnd;
  final bool cancelAtPeriodEnd;
  final bool deleted;

  const Subscription({
    required this.id,
    required this.amount,
    required this.wallet,
    required this.status,
    required this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    required this.deleted,
  });

  Subscription.deserialize(Map<String, dynamic> json): this(
    id: json["id"],
    amount: json["amount"],
    wallet: Wallet.deserialize(json["wallet"]),
    status: json["status"],
    currentPeriodEnd: DateTime.parse(json["current_period_end"]),
    cancelAtPeriodEnd: json["cancel_at_period_end"],
    deleted: json["deleted"],
  );
}
