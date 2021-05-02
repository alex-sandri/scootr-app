import 'package:flutter/material.dart';
import 'package:scootr/services/Auth.dart';

class ScootrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final List<Widget>? actions;

  @override
  final Size preferredSize;

  ScootrAppBar({
    this.title,
    this.actions,
  }): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "scootr"),
      actions: [
        ...actions ?? [],
        if (AuthService.session != null)
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: AuthService.session!.user.email,
            onPressed: () {
              // TODO
            }
          ),
      ],
    );
  }
}