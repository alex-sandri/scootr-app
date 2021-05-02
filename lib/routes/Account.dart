import 'package:flutter/material.dart';
import 'package:scootr/widgets/AppBar.dart';
import 'package:scootr/widgets/Drawer.dart';

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: ScootrAppBar(
          title: "Account",
          tabs: [
            Tab(icon: Icon(Icons.account_circle), text: "Dettagli"),
          ],
        ),
        body: TabBarView(
          children: [
            Text("asa"),
          ],
        ),
        drawer: ScootrDrawer(),
      ),
    );
  }
}
