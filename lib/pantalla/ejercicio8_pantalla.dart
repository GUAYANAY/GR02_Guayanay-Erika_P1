import 'package:flutter/material.dart';

import '../logica/ejercicio8_logica.dart';

class Ejercicio8Pantalla extends StatefulWidget {
  const Ejercicio8Pantalla({super.key});

  @override
  State<Ejercicio8Pantalla> createState() => _Ejercicio8PantallaState();
}

class _Ejercicio8PantallaState extends State<Ejercicio8Pantalla> {
  // Instanciamos la logica
  final Ejercicio8Logica _logica = Ejercicio8Logica();
  final TextEditingController _numeroController = TextEditingController();

  String _resultado = '';
  String _mensaje = '';

  void _calcular() {
    int? numero = int.tryParse(_numeroController.text);

    // Validamos que sea un número entero positivo
    if (numero == null || numero <= 0) {
      setState(() {
        _mensaje = 'Ingrese un número entero positivo válido';
        _resultado = '';
      });
      return;
    }

    // Llamamos a la lógica si todo está bien
    setState(() {
      _resultado = _logica.invertir(numero);
      _mensaje = '';
    });
  }

  void _limpiar() {
    setState(() {
      _numeroController.clear();
      _resultado = '';
      _mensaje = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 8: Inversión'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Ingrese un número para invertirlo:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número entero positivo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calcular,
                  child: const Text('Invertir'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _limpiar,
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Mensaje de error 
            Text(
              _mensaje,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
            // Resultado (si hay)
            if (_resultado.isNotEmpty)
              Text(
                'Número invertido: $_resultado',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
