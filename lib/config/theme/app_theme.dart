import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const sendColor = Colors.deepPurple;
    return ThemeData(
      colorSchemeSeed: sendColor,
      listTileTheme: const ListTileThemeData(iconColor: sendColor),
    );
  }
}
