import 'package:flutter/material.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/widgets/misc/PaymentMethod.dart';

class WalletPaymentMethods extends StatelessWidget {
  final Wallet _wallet;

  WalletPaymentMethods(this._wallet);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse<List<PaymentMethod>>>(
      future: ApiService.listPaymentMethodsForWallet(_wallet),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<PaymentMethod> paymentMethods = snapshot.data!.data!;

        return ListView.builder(
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return PaymentMethodWidget(paymentMethods[index]);
          },
        );
      },
    );
  }
}
