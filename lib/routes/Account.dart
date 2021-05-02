import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Auth.dart';
import 'package:scootr/widgets/AppBar.dart';

class AccountRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(
        title: "Account",
      ),
      body: Container(),
      drawer: Builder(
        builder: (context) {
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
                  leading: Icon(Icons.account_circle),
                  title: Text("Account"),
                  onTap: () {
                    
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
      ),
    );
  }
}
