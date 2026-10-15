class Ejercicio9Logica {
  
  int sumarDigitos(int numero) {
    int suma = 0;
    int auxiliar = numero;

    while (auxiliar > 0) {
      suma += auxiliar % 10; 
      auxiliar = auxiliar ~/ 10; 
    }
    return suma;
  }

  String verificarParidad(int suma) {
    if (suma % 2 == 0) {
      return 'Par';
    } else {
      return 'Impar';
    }
  }
}