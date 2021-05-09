import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/Account.dart';
import 'package:scootr/routes/Map.dart';
import 'package:scootr/routes/Settings.dart';
import 'package:scootr/services/Auth.dart';
import 'package:scootr/widgets/common/UserBuilder.dart';

class ScootrDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScootrUserBuilder(
      builder: (user) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Config.DANGER_COLOR,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(user.fiscalNumber),
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
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Impostazioni"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SettingsRoute(),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Esci"),
                onTap: Provider.of<AuthService>(context, listen: false).signOut,
              ),
            ],
          ),
        );
      }
    );
  }
}
