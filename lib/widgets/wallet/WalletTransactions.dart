import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scootr/models/Transaction.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';

class WalletTransactions extends StatelessWidget {
  final Wallet _wallet;

  WalletTransactions(this._wallet);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse<List<Transaction>>>(
      future: ApiService.listTransactionsForWallet(_wallet),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Transaction> transactions = snapshot.data!.data!;

        return ListView.builder(
          itemBuilder: (context, index) {
            final Transaction transaction = transactions[index];

            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text(
                      DateFormat
                        .yMMMMd()
                        .add_jms()
                        .format(transaction.timestamp),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
