import 'package:flutter/material.dart';
import '../logica/ejercicio9_logica.dart';

class Ejercicio9Pantalla extends StatefulWidget {
  const Ejercicio9Pantalla({super.key});

  @override
  State<Ejercicio9Pantalla> createState() => _Ejercicio9PantallaState();
}

class _Ejercicio9PantallaState extends State<Ejercicio9Pantalla> {
  final Ejercicio9Logica _logica = Ejercicio9Logica();
  final TextEditingController _numeroController = TextEditingController();

  String _resultado = '';
  String _mensaje = '';

  void _calcular() {
    int? numero = int.tryParse(_numeroController.text);

    if (numero == null || numero <= 0) {
      setState(() {
        _mensaje = 'Ingrese un número entero positivo válido';
        _resultado = '';
      });
      return;
    }

    // 1. Llamamos a la primera función para obtener la suma
    int sumaTotal = _logica.sumarDigitos(numero);
    
    // 2. Llamamos a la segunda función pasándole la suma
    String tipo = _logica.verificarParidad(sumaTotal);

    setState(() {
      _resultado = 'La suma de sus dígitos es: $sumaTotal\n\n'
                   'El resultado es un número: $tipo';
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
        title: const Text('Ejercicio 9: Suma de dígitos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Ingrese un número para sumar sus dígitos:', style: TextStyle(fontSize: 16)),
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
                  child: const Text('Calcular'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _limpiar,
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _mensaje,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
            if (_resultado.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _resultado,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}