import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:scootr/widgets/common/AppBar.dart';

class CieCardReaderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(
        title: "Entra con CIE",
      ),
      body: FutureBuilder<bool>(
        future: NfcManager.instance.isAvailable(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      ),
    );
  }
}
