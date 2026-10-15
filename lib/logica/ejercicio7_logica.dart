class Ejercicio7Logica {
  
  List<int> calcularDivisores(int numero) {
    List<int> divisores = [];

    for (int i = 1; i <= numero; i++) {
      if (numero % i == 0) {
        divisores.add(i);
      }
    }

    return divisores;
  }
}