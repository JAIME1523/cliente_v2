import 'package:flutter/material.dart';

class AppTheme {
 static ThemeData getTheme() => ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
     seedColor: Colors.black87,
    primary: Colors.black87,
    secondaryContainer: Colors.black87.withOpacity(0.07)
    ), 
  );
}