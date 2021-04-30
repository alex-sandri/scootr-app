import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:scootr/widgets/AppBar.dart';

class MapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(41.9027835, 12.4963655),
          zoom: 18,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: [ "a", "b", "c" ],
          ),
        ],
      ),
    );
  }
}