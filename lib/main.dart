import 'package:expenxe/expense.dart';
import 'package:flutter/material.dart';

var P = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0));
void main() {
  var p;
  runApp(MaterialApp(
    darkTheme: ThemeData.dark(),
    theme: ThemeData().copyWith(
        
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color.fromARGB(255, 22, 21, 21),
          foregroundColor: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          color: Color.fromARGB(255, 0, 0, 0),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: P.primaryContainer),
        ),
        textTheme: TextTheme().copyWith(
            titleLarge: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black),
            bodyLarge: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
                
                )
                
                ),
                
            themeMode: ThemeMode.system,     
    home: const exp(),
  ));
}
