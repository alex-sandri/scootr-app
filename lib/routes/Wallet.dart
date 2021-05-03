import 'package:flutter/material.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/widgets/AppBar.dart';
import 'package:scootr/widgets/Drawer.dart';

class WalletRoute extends StatelessWidget {
  final Wallet _wallet;

  WalletRoute(this._wallet);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: _wallet.name,
          tabs: [
            Tab(
              icon: Icon(Icons.info_outline),
              text: "Dettagli",
            ),
            Tab(
              icon: Icon(Icons.payment),
              text: "Metodi di pagamento",
            ),
            Tab(
              icon: Icon(Icons.schedule),
              text: "Ricariche periodiche",
            ),
            Tab(
              icon: Icon(Icons.history),
              text: "Storico transazioni",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}
