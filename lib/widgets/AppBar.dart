import 'package:flutter/material.dart';

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
      actions: actions,
    );
  }
}
