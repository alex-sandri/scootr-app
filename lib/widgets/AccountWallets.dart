import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/services/Auth.dart';

class AccountWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<AuthService>(context).session!.user;

    return FutureBuilder<ApiResponse<List<Wallet>>>(
      future: ApiService.listWalletsForUser(user),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final wallets = snapshot.data?.data;

        return ListView(
          children: wallets?.map((wallet) {
            return ListTile(
              title: Text(wallet.name),
            );
          }).toList() ?? [],
        );
      }
    );
  }
}
