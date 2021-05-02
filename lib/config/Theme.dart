import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';

class ThemeConfig {
  static ThemeData light(BuildContext context) {
    return ThemeData(
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
    );
  }
}
