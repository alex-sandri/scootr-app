import 'package:flutter/material.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/widgets/common/RefreshableView.dart';
import 'package:scootr/widgets/misc/PaymentMethod.dart';

class WalletPaymentMethods extends StatefulWidget {
  final Wallet _wallet;

  WalletPaymentMethods(this._wallet);

  @override
  _WalletPaymentMethodsState createState() => _WalletPaymentMethodsState();
}

class _WalletPaymentMethodsState extends State<WalletPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScootrRefreshableView<ApiResponse<List<PaymentMethod>>>(
        future: () => ApiService.listPaymentMethodsForWallet(widget._wallet),
        builder: (result) {
          final List<PaymentMethod> paymentMethods = result.data!;

          return ListView.builder(
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              return PaymentMethodWidget(paymentMethods[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Aggiungi",
        onPressed: () {
          // TODO
        },
      ),
    );
  }
}
