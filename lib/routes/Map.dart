import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/services/Auth.dart';
import 'package:scootr/widgets/AppBar.dart';

class MapRoute extends StatelessWidget {
  final LatLng _currentLocation = LatLng(41.9027835, 12.4963655);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              center: _currentLocation,
              zoom: 18,
              maxZoom: 19,
              minZoom: 15,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: [ "a", "b", "c" ],
                maxZoom: 19,
                minZoom: 15,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: TextButton.icon(
              icon: Icon(Icons.qr_code_scanner),
              label: Text("Inizia corsa"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Config.SECONDARY_COLOR),
                backgroundColor: MaterialStateProperty.all(Config.DANGER_COLOR),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              onPressed: () {
                // TODO
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${AuthService.session!.user.firstName} ${AuthService.session!.user.lastName}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(AuthService.session!.user.email),
                  Text(AuthService.session!.user.birthDate.toString()),
                  Text(AuthService.session!.user.fiscalNumber),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}