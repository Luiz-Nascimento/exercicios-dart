void main() {
  print('Numeros com a caracteristica (de 1000 a 9999):');

  for (int numero = 1000; numero <= 9999; numero++) {
    int primeiraParte = numero ~/ 100;
    int segundaParte = numero % 100;   

    int soma = primeiraParte + segundaParte;

    if (soma * soma == numero) {
      print('$numero = $primeiraParte + $segundaParte = $soma * $soma');
    }
  }
}