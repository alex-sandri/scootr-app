import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/services/Api.dart';

class WalletDetails extends StatefulWidget {
  final Wallet _wallet;

  final void Function(Wallet) onUpdate;

  WalletDetails(this._wallet, {
    required this.onUpdate
  });

  @override
  _WalletDetailsState createState() => _WalletDetailsState(_wallet);
}

class _WalletDetailsState extends State<WalletDetails> {
  Wallet _wallet;

  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController();

  _WalletDetailsState(this._wallet);

  @override
  void initState() {
    super.initState();

    _nameController.text = _wallet.name;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Saldo"),
                  Text(
                    NumberFormat
                      .simpleCurrency(
                        locale: Localizations.localeOf(context).toString(),
                      )
                      .format(_wallet.balance),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add),
              tooltip: "Ricarica",
              onPressed: () {
                // TODO
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          enabled: _isEditing,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isEditing
                          ? Icons.check
                          : Icons.edit,
                      ),
                      onPressed: () async {
                        if (!_isEditing)
                        {
                          setState(() {
                            _isEditing = true;
                          });

                          return;
                        }

                        await ApiService.updateWallet(
                          _wallet,
                          name: _nameController.text,
                        );

                        widget.onUpdate(
                          _wallet.copyWith(
                            name: _nameController.text,
                          ),
                        );

                        setState(() {
                          _isEditing = false;

                          _wallet = _wallet.copyWith(
                            name: _nameController.text,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
