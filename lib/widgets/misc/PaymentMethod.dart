import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/PaymentMethod.dart';

enum PaymentMethodButton
{
  SET_DEFAULT,
  DELETE,
}

class PaymentMethodWidget extends StatelessWidget {
  final PaymentMethod _paymentMethod;

  final void Function(PaymentMethod) onUpdate;
  final void Function() onDelete;

  PaymentMethodWidget(this._paymentMethod, {
    required this.onUpdate,
    required this.onDelete,
  });

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
          onSelected: (type) {
            switch (type)
            {
              case PaymentMethodButton.SET_DEFAULT:
              {
                // TODO

                break;
              }
              case PaymentMethodButton.DELETE:
              {
                // TODO

                break;
              }
            }
          },
        ),
      ),
    );
  }
}
