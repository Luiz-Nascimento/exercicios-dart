import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Digite o numero de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  double soma = 0;
  int base = 3;
  int expoente = 4;
  int denominador = 5;
  int sinal = 1;

  for (int i = 1; i <= n; i++) {
    double termo = pow(base, expoente) / denominador;

    soma = soma + sinal * termo;

    if (i >= 3) {
      sinal = sinal * -1;
    }

    base = base + 2;
    expoente = expoente + 4;
    denominador = denominador + 5;
  }

  print('S = $soma');
}