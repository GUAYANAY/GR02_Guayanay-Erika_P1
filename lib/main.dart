import 'package:flutter/material.dart';
import 'pantalla/menu.dart';
import 'pantalla/ejercicio8_pantalla.dart';
import 'pantalla/ejercicio9_pantalla.dart';
import 'pantalla/ejercicio7_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPantalla(),
        '/ejercicio8': (context) => const Ejercicio8Pantalla(),
         '/ejercicio9': (context) => const Ejercicio9Pantalla(),
         '/ejercicio7': (context) => const Ejercicio7Pantalla(),
      },
    );
  }
}