import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/Wallet.dart';
import 'package:scootr/routes/Wallet.dart';
import 'package:scootr/services/Api.dart';
import 'package:scootr/widgets/common/UserBuilder.dart';

enum WalletButton
{
  SET_DEFAULT,
  DELETE,
}

class AccountWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScootrUserBuilder(
      builder: (user) {
        return FutureBuilder<ApiResponse<List<Wallet>>>(
          future: ApiService.listWalletsForUser(user),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final List<Wallet> wallets = snapshot.data!.data!;

            return ListView.builder(
              itemCount: wallets.length,
              itemBuilder: (context, index) {
                final Wallet wallet = wallets[index];

                return Card(
                  child: ListTile(
                    shape: Theme.of(context).cardTheme.shape,
                    leading: wallet.isDefault ?? false
                      ? Icon(Icons.favorite)
                      : null,
                    title: Text(wallet.name),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem<WalletButton>(
                            value: WalletButton.SET_DEFAULT,
                            child: Text("Imposta come predefinito"),
                          ),
                          const PopupMenuItem<WalletButton>(
                            value: WalletButton.DELETE,
                            child: Text(
                              "Elimina",
                              style: TextStyle(
                                color: Config.DANGER_COLOR,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
                    onTap: () {
                      Navigator
                        .of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => WalletRoute(wallet),
                          ),
                        );
                    },
                  ),
                );
              },
            );
          }
        );
      }
    );
  }
}
