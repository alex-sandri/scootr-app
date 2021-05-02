import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/routes/Account.dart';
import 'package:scootr/routes/Map.dart';
import 'package:scootr/services/Auth.dart';

class ScootrDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);
    final Session session = auth.session!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${session.user.firstName} ${session.user.lastName}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(session.user.email),
                Text(DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(session.user.birthDate)),
                Text(session.user.fiscalNumber),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Mappa"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MapRoute(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AccountRoute(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Esci"),
            onTap: auth.signOut,
          ),
        ],
      ),
    );
  }
}