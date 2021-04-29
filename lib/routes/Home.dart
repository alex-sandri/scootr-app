import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/widgets/AppBar.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton.icon(
              icon: SvgPicture.asset(
                "assets/images/spid-icon.svg",
                height: 25,
              ),
              label: Text("Entra con SPID"),
              style: Theme.of(context).textButtonTheme.style.copyWith(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
              ),
              onPressed: () {

              },
            ),
            SizedBox(height: 10),
            TextButton.icon(
              icon: SvgPicture.asset(
                "assets/images/cie-icon.svg",
                height: 25,
              ),
              label: Text("Entra con CIE"),
              style: Theme.of(context).textButtonTheme.style.copyWith(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
              ),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}