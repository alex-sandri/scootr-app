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

          if (!snapshot.data!)
          {
            return ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Text(
                  "NFC non disponibile",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 5),
                Text(
                  "Per utilizzare questa funzionalità è necessario"
                  " poter accedere al lettore NFC del dispositivo."
                  "\n"
                  "Verifica che il tuo dispositivo disponga del lettore"
                  " e che sia abilitato.",
                ),
              ],
            );
          }

          NfcManager.instance.startSession(
            onDiscovered: (tag) async {
              // TODO
            },
          );

          return Container();
        },
      ),
    );
  }
}
