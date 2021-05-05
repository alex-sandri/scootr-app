import 'package:flutter/material.dart';
import 'package:scootr/config/Config.dart';

class ThemeConfig {
  static ThemeData dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Config.PRIMARY_COLOR,
      accentColor: Config.SECONDARY_COLOR,
      canvasColor: Config.PRIMARY_COLOR,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Config.PRIMARY_COLOR,
        elevation: 0,
      ),
      cardTheme: Theme.of(context).cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      dividerColor: Config.SECONDARY_COLOR,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Config.SECONDARY_COLOR,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Config.SECONDARY_COLOR,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Config.SECONDARY_COLOR,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Config.DANGER_COLOR,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Config.DANGER_COLOR,
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(),
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
          displayColor: Config.SECONDARY_COLOR,
        ),
      primaryTextTheme: Theme.of(context).primaryTextTheme
        .apply(
          fontFamily: "WorkSans",
        ),
      accentTextTheme: Theme.of(context).accentTextTheme
        .apply(
          fontFamily: "WorkSans",
        ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Config.PRIMARY_COLOR),
          backgroundColor: MaterialStateProperty.all(Config.SECONDARY_COLOR),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: "WorkSans",
              fontSize: 20,
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
        foregroundColor: Config.PRIMARY_COLOR,
        backgroundColor: Config.SECONDARY_COLOR,
      ),
    );
  }
}
