import 'package:flutter/material.dart';
import 'package:scootr/models/Wallet.dart';

class WalletDetails extends StatelessWidget {
  final Wallet _wallet;

  WalletDetails(this._wallet);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                initialValue: _wallet.name,
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text("Aggiorna"),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
