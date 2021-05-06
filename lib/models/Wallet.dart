import 'package:scootr/models/User.dart';

class Wallet {
  final String id;
  final String name;
  final num balance;
  final User user;
  final bool? isDefault;

  const Wallet({
    required this.id,
    required this.name,
    required this.balance,
    required this.user,
    this.isDefault,
  });

  Wallet.deserialize(Map<String, dynamic> json): this(
    id: json["id"],
    name: json["name"],
    balance: json["balance"],
    user: User.deserialize(json["user"]),
    isDefault: json["__metadata"]?["is_default"],
  );

  Wallet copyWith({
    String? name,
  }) {
    return Wallet(
      id: this.id,
      name: name ?? this.name,
      balance: this.balance,
      user: this.user,
      isDefault: this.isDefault,
    );
  }
}
