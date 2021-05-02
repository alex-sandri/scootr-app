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

  static Wallet deserialize(Map<String, dynamic> json) {
    return Wallet(
      id: json["id"],
      name: json["name"],
      balance: num.parse(json["balance"]),
      user: User.deserialize(json["user"]),
      isDefault: json["__metadata"]?["is_default"],
    );
  }
}
