import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scootr/config/Config.dart';
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
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final Transaction transaction = transactions[index];

            String _getDisplayReason(String reason) {
              switch (reason)
              {
                case "top-up": return "Accredito";
                case "ride": return "Corsa";
                case "subscription": return "Ricarica periodica";
                default: return reason;
              }
            }

            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text(
                      DateFormat
                        .yMMMMd(Localizations.localeOf(context).toString())
                        .add_jms()
                        .format(transaction.timestamp),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.euro),
                    title: Text(
                      NumberFormat
                        .simpleCurrency(
                          locale: Localizations.localeOf(context).toString(),
                        )
                        .format(transaction.amount),
                      style: TextStyle(
                        color: transaction.amount < 0
                          ? Config.DANGER_COLOR
                          : null,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text(_getDisplayReason(transaction.reason)),
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
