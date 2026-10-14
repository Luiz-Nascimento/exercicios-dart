import 'dart:io';
import 'dart:math';

int fatorial(int n) {
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado = resultado * i;
  }
  return resultado;
}

void main() {
  stdout.write('Digite o numero de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  stdout.write('Digite o valor de X: ');
  double x = double.parse(stdin.readLineSync()!);

  double soma = 0;
  int expoente = 2;
  int d = 1;
  int passo = 1;

  for (int i = 1; i <= n; i++) {
    soma = soma + pow(x, expoente) / fatorial(d);

    expoente++;

    if (d == 4) {
      passo = -1;
    } else if (d == 1) {
      passo = 1;
    }
    d = d + passo;
  }

  print('S = $soma');
}