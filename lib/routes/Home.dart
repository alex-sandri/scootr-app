import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/SpidIdpList.dart';
import 'package:scootr/widgets/common/AppBar.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScootrAppBar(),
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              showSkipButton: false,
              showDoneButton: false,
              showNextButton: false,
              dotsDecorator: DotsDecorator(
                color: Config.SECONDARY_COLOR.withAlpha(150),
                activeColor: Config.SECONDARY_COLOR,
              ),
              pages: [
                PageViewModel(
                  titleWidget: Row(
                    children: [
                      Text(
                        "Evita l'auto",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  bodyWidget: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Per piccoli spostamenti preferisci un mezzo"
                          " "
                          "sostenibile come la bicicletta o il monopattino",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                  image: Image.asset("assets/images/intro/1.png"),
                  decoration: PageDecoration(
                    imagePadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                PageViewModel(
                  titleWidget: Row(
                    children: [
                      Text(
                        "Evita il traffico",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  bodyWidget: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Utilizzando un mezzo di spostamento alternativo"
                          " "
                          "puoi evitare il traffico per esempio utilizzando"
                          " "
                          "le piste ciclabili",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                  image: Image.asset("assets/images/intro/2.png"),
                  decoration: PageDecoration(
                    imagePadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
                PageViewModel(
                  titleWidget: Row(
                    children: [
                      Text(
                        "Aiuta il Paese",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  bodyWidget: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Puoi inoltre contribuire alla riduzione"
                          " "
                          "del livello di inquinamento atmosferico"
                          " "
                          "e aiutare così a portare il Paese verso"
                          " "
                          "un futuro più sostenibile",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                  image: Image.asset("assets/images/intro/3.png"),
                  decoration: PageDecoration(
                    imagePadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Evita l'auto.",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Evita il traffico.",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Aiuta il Paese.",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Diventa parte della rivoluzione della micro-mobilità sostenibile.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          */
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton.icon(
                  icon: SvgPicture.asset(
                    "assets/images/spid-icon.svg",
                    height: 25,
                  ),
                  label: Text("Entra con SPID"),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SpidIdpListRoute(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                TextButton.icon(
                  icon: SvgPicture.asset(
                    "assets/images/cie-icon.svg",
                    height: 25,
                  ),
                  label: Text("Entra con CIE"),
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Config.SPID_COLOR),
                  ),
                  onPressed: () {
                    // TODO
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
