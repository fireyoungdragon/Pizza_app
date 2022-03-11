import 'package:flutter/material.dart';

const blackColor = Color.fromARGB(255, 0, 0, 0);
const whiteColor = Color.fromARGB(255, 255, 255, 255);
const iconColor = blackColor;
const snackBarColor = Color.fromARGB(188, 75, 0, 250);

ThemeData globalOrangeTheme() => ThemeData(
    fontFamily: 'Georgia',
    splashColor: const Color.fromARGB(255, 3, 136, 244),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
    ).copyWith(secondary: const Color.fromARGB(255, 255, 255, 255)),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      headline2: TextStyle(
        fontSize: 18,
        color: blackColor,
        decoration: TextDecoration.underline,
      ),
      headline3: TextStyle(
        fontSize: 24,
        color: blackColor,
      ),
      bodyText1: TextStyle(
          fontSize: 14, color: blackColor, fontWeight: FontWeight.bold),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      headline5: TextStyle(
        fontSize: 18,
        color: whiteColor,
      ),
      headline6: TextStyle(
        fontSize: 24,
        color: whiteColor,
      ),
      bodyText2: TextStyle(
          fontSize: 14, color: whiteColor, fontWeight: FontWeight.bold),
    ));
