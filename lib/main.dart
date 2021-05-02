import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/Home.dart';
import 'package:scootr/routes/Map.dart';
import 'package:scootr/services/Auth.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      title: "scootr",
      theme: ThemeData(
        fontFamily: "WorkSans",
        scaffoldBackgroundColor: Config.PRIMARY_COLOR,
        accentColor: Config.SECONDARY_COLOR,
        canvasColor: Config.PRIMARY_COLOR,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Config.PRIMARY_COLOR,
          elevation: 0,
        ),
        textTheme: Theme.of(context).textTheme
          .copyWith(
            headline6: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          )
          .apply(
            fontFamily: "WorkSans",
            bodyColor: Config.SECONDARY_COLOR,
          ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Config.PRIMARY_COLOR),
            backgroundColor: MaterialStateProperty.all(Config.SECONDARY_COLOR),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: "WorkSans",
                fontSize: 18,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Config.SECONDARY_COLOR,
          backgroundColor: Config.PRIMARY_COLOR,
        ),
      ),
      home: FutureBuilder<bool>(
        future: AuthService.init(),
        builder: (context, isSignedIn) {
          if (!isSignedIn.hasData)
          {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return isSignedIn.data!
            ? MapRoute()
            : HomeRoute();
        },
      ),
    );
  }
}
