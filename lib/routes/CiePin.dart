import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/CieCardReader.dart';
import 'package:scootr/widgets/common/AppBar.dart';

class CiePinRoute extends StatefulWidget {
  @override
  _CiePinRouteState createState() => _CiePinRouteState();
}

class _CiePinRouteState extends State<CiePinRoute> {
  bool _enableContinueButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(
        title: "Entra con CIE",
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            "Inserisci il PIN della tua carta di identità",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 15),
          PinCodeTextField(
            appContext: context,
            length: 8,
            obscureText: true,
            animationType: AnimationType.scale,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeColor: Config.SECONDARY_COLOR,
              inactiveColor: Config.SECONDARY_COLOR.withAlpha(150),
              selectedColor: Config.SECONDARY_COLOR,
            ),
            onChanged: (value) {
              setState(() {
                _enableContinueButton = value.length == 8;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text("Prosegui"),
        onPressed: _enableContinueButton ? () {
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (_) => CieCardReaderRoute(),
              ),
            );
        } : null,
      ),
    );
  }
}
