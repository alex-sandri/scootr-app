import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/routes/Home.dart';
import 'package:scootr/services/Auth.dart';

class ScootrUserBuilder extends StatelessWidget {
  final Widget Function(User) builder;

  ScootrUserBuilder({
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final Session? session = Provider.of<AuthService>(context, listen: false).session;

    if (session == null)
    {
      Future.microtask(() {
        Navigator
          .of(context)
          .pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomeRoute(),
              transitionDuration: Duration(seconds: 0),
            ),
            (route) => false
        );
      });

      return Container();
    }

    return builder(session.user);
  }
}
