import 'package:flutter/material.dart';
import '../logica/ejercicio7_logica.dart';

class Ejercicio7Pantalla extends StatefulWidget {
  const Ejercicio7Pantalla({super.key});

  @override
  State<Ejercicio7Pantalla> createState() => _Ejercicio7PantallaState();
}

class _Ejercicio7PantallaState extends State<Ejercicio7Pantalla> {
  // Instanciamos 
  final Ejercicio7Logica _logica = Ejercicio7Logica();
  final TextEditingController _numeroController = TextEditingController();

  String _resultado = '';
  String _mensaje = '';

  void _calcular() {
    int? numero = int.tryParse(_numeroController.text);

    // Validación
    if (numero == null || numero <= 0) {
      setState(() {
        _mensaje = 'Ingrese un número entero positivo válido';
        _resultado = '';
      });
      return;
    }

    // 1. Obtenemos solo la lista desde la lógica
    List<int> divisores = _logica.calcularDivisores(numero);
    
    // 2. Calculamos la cantidad aquí mismo en la pantalla usando .length
    int cantidad = divisores.length; 

    // Actualizamos la pantalla
    setState(() {
      _resultado = 'Sus divisores son:\n${divisores.join(', ')}\n\n'
                   'Cantidad total de divisores: $cantidad';
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
        title: const Text('Ejercicio 7: Divisores'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Ingrese un número para calcular sus divisores:', style: TextStyle(fontSize: 16)),
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
            // Mensaje de error
            Text(
              _mensaje,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
            // Contenedor de resultados
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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}