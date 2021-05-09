import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/SpidIdpSignIn.dart';
import 'package:scootr/widgets/common/AppBar.dart';
import 'package:url_launcher/url_launcher.dart';

class SpidIdpListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(
        title: "Entra con SPID",
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            "Seleziona il tuo Identity Provider",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final idp in Config.SPID_IDENTITY_PROVIDERS)
                Container(
                  width: ((MediaQuery.of(context).size.width - 20) * 0.5) - 5,
                  child: TextButton(
                    child: SvgPicture.asset(
                      "assets/images/spid/${idp.id}.svg",
                      height: 25,
                      placeholderBuilder: (_) => Text(idp.name),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SpidIdpSignInRoute(idp: idp),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
          SizedBox(height: 30),
          TextButton(
            child: Text("Maggiori info"),
            onPressed: () async {
              const url = "https://www.spid.gov.it/";

              if (await canLaunch(url))
              {
                launch(url);
              }
            },
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text("Non hai SPID?"),
            onPressed: () async {
              const url = "https://www.spid.gov.it/richiedi-spid";

              if (await canLaunch(url))
              {
                launch(url);
              }
            },
          ),
        ],
      ),
    );
  }
}
