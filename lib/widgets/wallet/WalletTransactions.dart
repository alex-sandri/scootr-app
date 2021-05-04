import 'package:flutter/material.dart';
import 'package:scootr/models/Transaction.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';

class WalletTransactions extends StatelessWidget {
  final Wallet _wallet;

  WalletTransactions(this._wallet);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: ApiService.listTransactionsForWallet(_wallet),
      builder: ,
    );
  }
}
