import 'package:flutter/material.dart';

class MenuPantalla extends StatelessWidget {
  const MenuPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Ejercicios'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ejercicio8'),
              child: const Text('Ejercicio 8: Inversión de número'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ejercicio9'),
              child: const Text('Ejercicio 9: Suma de dígitos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ejercicio7'),
              child: const Text('Ejercicio 7: Divisores de un número'),
            ),
          ],
        ),
      ),
    );
  }
}
