import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scootr/widgets/common/UserBuilder.dart';

class AccountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScootrUserBuilder(
      builder: (user) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text("Nome"),
                subtitle: Text(user.firstName),
              ),
              ListTile(
                title: Text("Cognome"),
                subtitle: Text(user.lastName),
              ),
              ListTile(
                title: Text("Email"),
                subtitle: Text(user.email),
              ),
              ListTile(
                title: Text("Data di nascita"),
                subtitle: Text(DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(user.birthDate)),
              ),
              ListTile(
                title: Text("Codice Fiscale"),
                subtitle: Text(user.fiscalNumber),
              ),
            ],
          ),
        );
      }
    );
  }
}
