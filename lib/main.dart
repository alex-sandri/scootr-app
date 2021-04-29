import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/routes/Home.dart';

void main() {
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
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Config.PRIMARY_COLOR,
          elevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Config.PRIMARY_COLOR),
            backgroundColor: MaterialStateProperty.all(Config.SECONDARY_COLOR),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 18,
            )),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Config.SECONDARY_COLOR,
        ),
      ),
      home: HomeRoute(),
    );
  }
}
