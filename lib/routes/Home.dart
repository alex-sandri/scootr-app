import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/SpidIdpList.dart';
import 'package:scootr/widgets/AppBar.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evita l'auto.",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Evita il traffico.",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Aiuta il Paese.",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Diventa parte della rivoluzione della micro-mobilità sostenibile.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton.icon(
                  icon: SvgPicture.asset(
                    "assets/images/spid-icon.svg",
                    height: 25,
                  ),
                  label: Text("Entra con SPID"),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SpidIdpListRoute(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  icon: SvgPicture.asset(
                    "assets/images/cie-icon.svg",
                    height: 25,
                  ),
                  label: Text("Entra con CIE"),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
                  ),
                  onPressed: () {
                    // TODO
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}