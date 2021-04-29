import 'package:flutter/material.dart';

class ScootrAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  ScootrAppBar(): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("scootr"),
    );
  }
}