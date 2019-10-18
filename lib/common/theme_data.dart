import 'package:flutter/material.dart';
import 'package:ruff_wallet/common/constant.dart';

ThemeData genThemeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 1,
    ),
    scaffoldBackgroundColor: AppBackgroundColor,
    primaryColor: AppPrimaryColor,
    primaryColorBrightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
