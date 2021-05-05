import 'package:flutter/material.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';

class PaymentMethodWidget extends StatelessWidget {
  final PaymentMethod _paymentMethod;

  PaymentMethodWidget(this._paymentMethod);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Text(_paymentMethod.data["brand"]),
          ),
        ],
      ),
    );
  }
}
