import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scootr/models/Ride.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/services/Auth.dart';

class AccountRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<AuthService>(context).session!.user;

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
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Iniziata"),
                      subtitle: Text(ride.startTime.toIso8601String()),
                    ),
                  ],
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
