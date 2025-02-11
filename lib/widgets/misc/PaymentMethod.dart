import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/services/Api.dart';

enum PaymentMethodButton
{
  SET_DEFAULT,
  DELETE,
}

class PaymentMethodWidget extends StatelessWidget {
  final PaymentMethod _paymentMethod;

  const PaymentMethodWidget(this._paymentMethod);

  Widget? _getTitle() {
    switch (_paymentMethod.type)
    {
      case "card":
      {
        return Text(
          (_paymentMethod.data["brand"] as String).toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        );
      }
    }
  }

  Widget? _getSubtitle() {
    switch (_paymentMethod.type)
    {
      case "card":
      {
        return Text(
          "${(_paymentMethod.data["exp_month"] as int).toRadixString(10).padLeft(2, "0")} / ${_paymentMethod.data["exp_year"]}"
          "    "
          "\u2022\u2022\u2022\u2022 ${_paymentMethod.data["last4"]}",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _paymentMethod.isDefault ?? false
          ? Icon(Icons.favorite)
          : null,
        title: _getTitle(),
        subtitle: _getSubtitle(),
        trailing: PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem<PaymentMethodButton>(
                value: PaymentMethodButton.SET_DEFAULT,
                child: Text("Imposta come predefinito"),
              ),
              const PopupMenuItem<PaymentMethodButton>(
                value: PaymentMethodButton.DELETE,
                child: Text(
                  "Elimina",
                  style: TextStyle(
                    color: Config.DANGER_COLOR,
                  ),
                ),
              ),
            ];
          },
          onSelected: (type) async {
            switch (type)
            {
              case PaymentMethodButton.SET_DEFAULT:
              {
                final response = await ApiService.setDefaultPaymentMethodForWallet(
                  paymentMethod: _paymentMethod,
                  wallet: _paymentMethod.wallet,
                );

                if (!response.success)
                {
                  return;
                }

                ScaffoldMessenger
                  .of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text("Modifica avvenuta con successo"),
                    ),
                  );

                break;
              }
              case PaymentMethodButton.DELETE:
              {
                final response = await ApiService.deletePaymentMethod(_paymentMethod);

                if (!response.success)
                {
                  return;
                }

                ScaffoldMessenger
                  .of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text("Il metodo di pagamento è stato eliminato correttamente"),
                    ),
                  );

                break;
              }
            }
          },
        ),
      ),
    );
  }
}
