import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scootr/models/Wallet.dart';

class WalletDetails extends StatelessWidget {
  final Wallet _wallet;

  WalletDetails(this._wallet);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Saldo"),
                  Text(
                    NumberFormat
                      .simpleCurrency(
                        locale: Localizations.localeOf(context).toString(),
                      )
                      .format(_wallet.balance),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              tooltip: "Ricarica",
              onPressed: () {
                // TODO
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _wallet.name,
                  decoration: InputDecoration(
                    labelText: "Nome",
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    child: Text("Aggiorna"),
                    onPressed: () {
                      // TODO
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
