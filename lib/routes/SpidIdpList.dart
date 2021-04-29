import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/widgets/AppBar.dart';

class SpidIdpListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
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
              for (final identityProvider in Config.SPID_IDENTITY_PROVIDERS)
                Container(
                  width: ((MediaQuery.of(context).size.width - 20) * 0.5) - 5,
                  child: TextButton(
                    child: SvgPicture.asset(
                      "assets/images/spid/${identityProvider.id}.svg",
                      height: 25,
                      placeholderBuilder: (_) => Text(identityProvider.name),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}