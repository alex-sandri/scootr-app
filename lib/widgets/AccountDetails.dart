import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Auth.dart';

class AccountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Session session = Provider.of<AuthService>(context).session!;

    return ListView(
      children: [
        ListTile(
          title: Text("Nome"),
          subtitle: Text(session.user.firstName),
        ),
      ],
    );
  }
}
