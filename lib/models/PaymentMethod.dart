import 'package:scootr/models/Wallet.dart';

class PaymentMethod {
  final String id;
  final String type;
  final dynamic data;
  final Wallet wallet;
  final bool? isDefault;

  const PaymentMethod({
    required this.id,
    required this.type,
    required this.data,
    required this.wallet,
    this.isDefault,
  });

  PaymentMethod.deserialize(Map<String, dynamic> json): this(
    id: json["id"],
    type: json["type"],
    data: json["data"],
    wallet: Wallet.deserialize(json["wallet"]),
    isDefault: json["__metadata"]?["is_default"],
  );
}
