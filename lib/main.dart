import 'package:cafe_valdivia/Components/navigation_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';

void main() async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: Color(0xFF7E570E),
    );
    return MaterialApp(
      title: 'Administracion Cafe',
      theme: ThemeData(colorScheme: colorScheme, useMaterial3: true),
      home: NavigationScreen(colorScheme: colorScheme),
      debugShowCheckedModeBanner: false,
    );
  }
}
