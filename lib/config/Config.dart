import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scootr/models/SpidIdentityProvider.dart';

class Config {
  static const Color PRIMARY_COLOR = Color(0xff008000);
  static const Color SECONDARY_COLOR = Colors.white;
  static const Color DANGER_COLOR = Color(0xfffb662e);

  static const Color SPID_COLOR = Color(0xff0066cc);

  static const List<SpidIdentityProvider> SPID_IDENTITY_PROVIDERS = [
    const SpidIdentityProvider(id: "arubaid", name: "Aruba ID"),
    const SpidIdentityProvider(id: "infocertid", name: "Infocert ID"),
    const SpidIdentityProvider(id: "intesaid", name: "Intesa ID"),
    const SpidIdentityProvider(id: "lepidaid", name: "Lepida ID"),
    const SpidIdentityProvider(id: "namirialid", name: "Namirial ID"),
    const SpidIdentityProvider(id: "posteid", name: "Poste ID"),
    const SpidIdentityProvider(id: "sielteid", name: "Sielte ID"),
    const SpidIdentityProvider(id: "spiditalia", name: "SPIDItalia Register.it"),
    const SpidIdentityProvider(id: "timid", name: "Tim ID"),

    if (kDebugMode)
      const SpidIdentityProvider(id: "idp_testenv2", name: "Test"),
  ];
}
