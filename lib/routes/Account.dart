import 'package:flutter/material.dart';
import 'package:scootr/widgets/account/AccountDetails.dart';
import 'package:scootr/widgets/account/AccountRides.dart';
import 'package:scootr/widgets/account/AccountWallets.dart';
import 'package:scootr/widgets/misc/AppBar.dart';
import 'package:scootr/widgets/misc/Drawer.dart';

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: "Account",
          tabs: [
            Tab(
              icon: Icon(Icons.info),
              text: "Dettagli",
            ),
            Tab(
              icon: Icon(Icons.account_balance_wallet),
              text: "Portafogli",
            ),
            Tab(
              icon: Icon(Icons.bike_scooter),
              text: "Corse",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            AccountDetails(),
            AccountWallets(),
            AccountRides(),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}
