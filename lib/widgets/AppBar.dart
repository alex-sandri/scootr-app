import 'package:flutter/material.dart';
import 'package:scootr/services/Auth.dart';

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
      actions: [
        ...this.actions ?? [],
        if (AuthService.user != null)
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: AuthService.user.email,
            onPressed: () {
              // TODO
            }
          ),
      ],
    );
  }
}