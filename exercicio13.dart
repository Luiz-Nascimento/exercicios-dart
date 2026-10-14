import 'dart:io';

void main() {
  stdout.write('Digite o valor de N: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Digite o elemento ${i + 1}: ');
    int valor = int.parse(stdin.readLineSync()!);
    vetor.add(valor);
  }

  List<int> jaContados = [];

  print('');
  print('Resultado');

  for (int i = 0; i < vetor.length; i++) {
    int atual = vetor[i];

    if (!jaContados.contains(atual)) {
      int quantidade = 0;

      for (int j = 0; j < vetor.length; j++) {
        if (vetor[j] == atual) {
          quantidade++;
        }
      }

      print('$atual - $quantidade');
      jaContados.add(atual);
    }
  }
}