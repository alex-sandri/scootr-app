import 'package:flutter/material.dart';

class ScootrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  @override
  final Size preferredSize;

  ScootrAppBar({
    this.actions,
  }): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("scootr"),
      actions: this.actions,
    );
  }
}