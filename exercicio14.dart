import 'dart:io';

List<int> lerVetor(String nomeVetor) {
  stdout.write('Tamanho do $nomeVetor: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('$nomeVetor, elemento ${i + 1}: ');
    int valor = int.parse(stdin.readLineSync()!);

    while (i > 0 && valor < vetor[i - 1]) {
      print('O vetor precisa estar ordenado. Digite um valor maior ou igual a ${vetor[i - 1]}.');
      stdout.write('$nomeVetor, elemento ${i + 1}: ');
      valor = int.parse(stdin.readLineSync()!);
    }

    vetor.add(valor);
  }

  return vetor;
}

void main() {
  List<int> vetorA = lerVetor('vetor A');
  print('');
  List<int> vetorB = lerVetor('vetor B');

  List<int> vetorC = [];
  int i = 0;
  int j = 0;

  while (i < vetorA.length && j < vetorB.length) {
    if (vetorA[i] <= vetorB[j]) {
      vetorC.add(vetorA[i]);
      i++;
    } else {
      vetorC.add(vetorB[j]);
      j++;
    }
  }

  while (i < vetorA.length) {
    vetorC.add(vetorA[i]);
    i++;
  }

  while (j < vetorB.length) {
    vetorC.add(vetorB[j]);
    j++;
  }

  print('');
  print('Vetor A: $vetorA');
  print('Vetor B: $vetorB');
  print('Vetor C (ordenado): $vetorC');
}