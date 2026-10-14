import 'dart:io';

List<int> lerVetor(int numero) {
  stdout.write('Tamanho do vetor $numero: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Vetor $numero, elemento ${i + 1}: ');
    int valor = int.parse(stdin.readLineSync()!);
    vetor.add(valor);
  }

  print('');
  return vetor;
}

void ordenar(List<int> vetor) {
  for (int i = 0; i < vetor.length - 1; i++) {
    for (int j = 0; j < vetor.length - 1 - i; j++) {
      if (vetor[j] > vetor[j + 1]) {
        int aux = vetor[j];
        vetor[j] = vetor[j + 1];
        vetor[j + 1] = aux;
      }
    }
  }
}

void main() {
  List<List<int>> vetores = [];

  for (int i = 1; i <= 4; i++) {
    vetores.add(lerVetor(i));
  }

  List<int> quinto = [];
  for (var v in vetores) {
    for (var valor in v) {
      quinto.add(valor);
    }
  }
  ordenar(quinto);

  List<int> intersecao = [];
  for (var valor in vetores[0]) {
    bool emTodos = true;

    for (int i = 1; i < 4; i++) {
      if (!vetores[i].contains(valor)) {
        emTodos = false;
      }
    }

    if (emTodos && !intersecao.contains(valor)) {
      intersecao.add(valor);
    }
  }
  ordenar(intersecao);

  for (int i = 0; i < 4; i++) {
    print('Vetor ${i + 1}: ${vetores[i]}');
  }

  print('');
  print('a) Quinto vetor (ordenado): $quinto');

  if (intersecao.isEmpty) {
    print('b) Nao ha elementos comuns aos 4 vetores.');
  } else {
    print('b) Intersecao dos 4 vetores: $intersecao');
  }
}