import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/widgets/AppBar.dart';

class SpidIdpListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
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
      ),
    );
  }
}