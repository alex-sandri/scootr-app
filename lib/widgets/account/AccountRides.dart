import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Ride.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/services/Auth.dart';

class AccountRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<AuthService>(context, listen: false).session!.user;

    return FutureBuilder<ApiResponse<List<Ride>>>(
      future: ApiService.listRidesForUser(user),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Ride> rides = snapshot.data!.data!;

        return ListView.builder(
          itemCount: rides.length,
          itemBuilder: (context, index) {
            final Ride ride = rides[index];

            return Card(
              child: InkWell(
                customBorder: Theme.of(context).cardTheme.shape,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textTheme: Theme.of(context).textTheme.copyWith(
                      subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.watch_later_outlined),
                        title: Text("Iniziata"),
                        subtitle: Text(
                          DateFormat
                            .yMMMMd(Localizations.localeOf(context).toString())
                            .add_jms()
                            .format(ride.startTime),
                        ),
                      ),

                      if (ride.endTime == null)
                        ListTile(
                          leading: Icon(Icons.watch_later_outlined),
                          title: Text(
                            "In corso",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),

                      if (ride.endTime != null)
                        ListTile(
                          leading: Icon(Icons.watch_later_outlined),
                          title: Text("Conclusa"),
                          subtitle: Text(
                            DateFormat
                              .yMMMMd(Localizations.localeOf(context).toString())
                              .add_jms()
                              .format(ride.endTime!)
                          ),
                        ),

                      if (ride.amount != null)
                        ListTile(
                          leading: Icon(Icons.euro),
                          title: Text("Costo"),
                          subtitle: Text(
                            NumberFormat
                              .simpleCurrency(
                                locale: Localizations.localeOf(context).toString(),
                              )
                              .format(ride.amount),
                          ),
                        ),
                    ],
                  ),
                ),
                onTap: () {
                  // TODO
                },
              ),
            );
          },
        );
      }
    );
  }
}
