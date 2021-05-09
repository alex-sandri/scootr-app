import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scootr/config/Theme.dart';
import 'package:scootr/routes/Home.dart';
import 'package:scootr/routes/Map.dart';
import 'package:scootr/services/Auth.dart';

void main() async {
  await Hive.initFlutter();

  await AuthService.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: Builder(
        builder: (context) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          );

          return FutureBuilder<bool>(
            future: () async {
              return Provider.of<AuthService>(context, listen: false).signIn();
            }(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
              {
                return MaterialApp(
                  theme: ThemeConfig.dark(context),
                  home: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              return MyApp();
            },
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "scootr",
      theme: ThemeConfig.dark(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("it"),
      ],
      home: Provider.of<AuthService>(context).session != null
        ? MapRoute()
        : HomeRoute(),
    );
  }
}
