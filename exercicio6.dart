import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numero = random.nextInt(100) + 1;

  int minimo = 1;
  int maximo = 100;
  int chute = 0;

  print('Adivinhe o numero entre 1 e 100!');

  while (chute != numero) {
    stdout.write('Digite um numero entre $minimo e $maximo: ');
    chute = int.parse(stdin.readLineSync()!);

    if (chute < minimo || chute > maximo) {
      print('Numero fora do intervalo, tente de novo.');
    } else if (chute < numero) {
      minimo = chute + 1;
      print('O numero e maior. Novo intervalo: $minimo a $maximo');
    } else if (chute > numero) {
      maximo = chute - 1;
      print('O numero e menor. Novo intervalo: $minimo a $maximo');
    } else {
      print('Parabens, voce acertou! O numero era $numero.');
    }
  }
}