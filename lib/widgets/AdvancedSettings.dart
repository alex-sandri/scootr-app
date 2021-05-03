import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';

class AdvancedSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      child: ListView(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.cloud_download_outlined),
                  title: Text("Esporta dati"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Esporta tutti i dati relativi al tuo account in nostro possesso"),
                      SizedBox(height: 10),
                      TextButton(
                        child: Text("Comincia"),
                        onPressed: () {
                          // TODO
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.delete_forever),
                  title: Text("Elimina account"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Se decidi di proseguire con l'eliminazione del tuo account:"),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("- Non potrai più recuperarne i dati"),
                            Text("- Qualsiasi importo di denaro attualmente nei tuoi portafogli non verrà restituito"),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        child: Text("Elimina"),
                        style: Theme.of(context).textButtonTheme.style!.copyWith(
                          foregroundColor: MaterialStateProperty.all(Config.SECONDARY_COLOR),
                          backgroundColor: MaterialStateProperty.all(Config.DANGER_COLOR),
                        ),
                        onPressed: () {
                          // TODO
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
