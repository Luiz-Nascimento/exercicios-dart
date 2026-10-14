import 'dart:io';

void main() {
  stdout.write('Digite um numero: ');
  int numero = int.parse(stdin.readLineSync()!);

  int invertido = 0;

  while (numero > 0) {
    int digito = numero % 10;
    invertido = invertido * 10 + digito;
    numero = numero ~/ 10;
  }

  print('Impressao: $invertido');
}