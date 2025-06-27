import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: const Color(0xFF181818),
  dividerColor: const Color(0xFF696969),
  appBarTheme: AppBarTheme(
    color: Color(0xFF181818),
    titleTextStyle: TextStyle(color: Color.fromARGB(255, 209, 209, 209), fontWeight: FontWeight.w800, fontSize: 25),
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFFEAEAEA), fontWeight: FontWeight.w800, fontSize: 20),
    bodySmall: TextStyle(color: Color(0xFF898989), fontWeight: FontWeight.w600, fontSize: 17),
  ),
);
