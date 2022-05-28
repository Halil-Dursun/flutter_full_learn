
import 'package:flutter/material.dart';

class LightTheme{
  final _lightColor = _LightColor();
  late ThemeData theme;
  
  LightTheme(){
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))
      ),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.green),
        side: BorderSide(color: Colors.green)
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          onPrimary: _lightColor.blueMana,
        )
      ),
    colorScheme: const ColorScheme.light(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor:Colors.red ),
    textTheme: ThemeData.light().textTheme.copyWith(
      subtitle1: TextStyle(fontSize: 25,color: _lightColor._textColor),
    ),
  );
  }
}  

class _LightColor{
  final Color _textColor = const Color.fromARGB(255, 37, 5, 5);
  final Color blueMana = const Color.fromRGBO(95, 188, 248, 1);
}