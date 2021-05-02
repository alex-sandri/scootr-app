import 'package:flutter/material.dart';
import 'package:scootr/widgets/AppBar.dart';
import 'package:scootr/widgets/Drawer.dart';

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(
        title: "Account",
      ),
      body: Container(),
      drawer: ScootrDrawer(),
    );
  }
}
