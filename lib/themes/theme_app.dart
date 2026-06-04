import 'package:flutter/material.dart';

class ThemeApp{
  static Color dorado = Color.fromARGB(255, 222, 171, 78);
  static ThemeData tema = ThemeData.dark().copyWith(
    appBarTheme: AppBarThemeData(
      iconTheme: IconThemeData(
        color: dorado,
        size: 30
      )
    )
  );
}