import 'package:flutter/material.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';
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
      body: FutureBuilder<ApiResponse<List<PaymentMethod>>>(
        future: ApiService.listPaymentMethodsForWallet(widget._wallet),
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
              return PaymentMethodWidget(
                paymentMethods[index],
                onUpdate: (_) {
                  setState(() {});
                },
                onDelete: () {
                  setState(() {});
                },
              );
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
