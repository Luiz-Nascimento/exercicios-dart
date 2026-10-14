import 'dart:io';

List<int> lerVetor(int numero, int tamanho) {
  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Vetor $numero, elemento ${i + 1}: ');
    int valor = int.parse(stdin.readLineSync()!);
    vetor.add(valor);
  }

  return vetor;
}

List<int> somarVetores(List<int> a, List<int> b) {
  List<int> resultado = [];

  for (int i = 0; i < a.length; i++) {
    resultado.add(a[i] + b[i]);
  }

  return resultado;
}

int somaElementos(List<int> vetor) {
  int soma = 0;

  for (int i = 0; i < vetor.length; i++) {
    soma = soma + vetor[i];
  }

  return soma;
}

void imprimirVetor(String nome, List<int> vetor) {
  print('$nome: $vetor');
}

void main() {
  stdout.write('Tamanho dos vetores: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  print('');
  List<int> vetorA = lerVetor(1, tamanho);
  print('');
  List<int> vetorB = lerVetor(2, tamanho);

  List<int> vetorC = somarVetores(vetorA, vetorB);
  int total = somaElementos(vetorC);

  print('');
  imprimirVetor('Vetor 1', vetorA);
  imprimirVetor('Vetor 2', vetorB);
  imprimirVetor('Vetor 3 (soma)', vetorC);
  print('Soma de todos os elementos do vetor 3: $total');
}