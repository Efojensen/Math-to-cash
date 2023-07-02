import 'package:flutter/material.dart';

const prim_Color = Colors.grey;
const color_accent = Color.fromARGB(255, 128, 126, 126);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightGreen,
  // primarySwatch: const MaterialColor(0xFF235433, <int, Color>{
  //     }),
      scaffoldBackgroundColor: Colors.white,
      // brightness: Brightness.light,
      textTheme: const TextTheme(),
      hoverColor: Colors.indigo,
      fontFamily: 'Wallpoet',
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white70,
        hoverColor: Colors.indigo,
        focusColor: Colors.indigo[700],)
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: prim_Color,
  primaryColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: color_accent
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 38.0, vertical: 15.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(color_accent)
    )
  ),
);