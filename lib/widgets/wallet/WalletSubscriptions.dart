import 'package:flutter/material.dart';
import 'package:scootr/models/Subscription.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';

class WalletSubscriptions extends StatelessWidget {
  final Wallet _wallet;

  WalletSubscriptions(this._wallet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ApiResponse<List<Subscription>>>(
        future: ApiService.listSubscriptionsForWallet(_wallet),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<Subscription> subscriptions = snapshot.data!.data!;

          return ListView.builder(
            itemCount: subscriptions.length,
            itemBuilder: (context, index) {
              final Subscription subscription = subscriptions[index];

              return ListTile(
                title: Text(subscription.id),
              );
            },
          );
        },
      ),
      floatingActionButton: TextButton.icon(
        icon: Icon(Icons.tune),
        label: Text("Gestisci"),
        onPressed: () {
          // TODO
        },
        style: Theme.of(context).textButtonTheme.style!.copyWith(
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
      ),
    );
  }
}
