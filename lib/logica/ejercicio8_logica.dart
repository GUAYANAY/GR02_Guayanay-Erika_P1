class Ejercicio8Logica {
  
  // Método matemático para invertir un número
  String invertir(int numero) {
    int numeroInvertido = 0;
    int auxiliar = numero;

    while (auxiliar > 0) {
      int ultimoDigito = auxiliar % 10; 
      
      numeroInvertido = (numeroInvertido * 10) + ultimoDigito; 
      
      auxiliar = auxiliar ~/ 10; 
    }

    return numeroInvertido.toString();
  }
}