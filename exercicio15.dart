import 'dart:io';

class Boi {
  int numero;
  double peso;

  Boi(this.numero, this.peso);

  @override
  String toString() {
    return "Boi numero: $numero | Peso: $peso";
  }
}

void main() {
  stdout.write('Digite a quantidade de bois: ');
  int n = int.parse(stdin.readLineSync()!);

  List<Boi> bois = [];

  for (int i = 0; i < n; i++) {
    print('');
    print('Boi ${i + 1}');

    stdout.write('Numero: ');
    int numero = int.parse(stdin.readLineSync()!);

    stdout.write('Peso: ');
    double peso = double.parse(stdin.readLineSync()!);

    Boi b = Boi(numero, peso);
    bois.add(b);
  }

  String continuar = 'S';

  while (continuar == 'S') {
    print('');
    stdout.write('Peso minimo: ');
    double minimo = double.parse(stdin.readLineSync()!);

    stdout.write('Peso maximo: ');
    double maximo = double.parse(stdin.readLineSync()!);

    print('');
    print('Bois com peso entre $minimo e $maximo:');

    bool achou = false;
    for (var b in bois) {
      if (b.peso >= minimo && b.peso <= maximo) {
        print(b);
        achou = true;
      }
    }

    if (!achou) {
      print('Nenhum boi encontrado nesse intervalo.');
    }

    print('');
    stdout.write('Fazer outra pesquisa? (S ou N): ');
    continuar = stdin.readLineSync()!.toUpperCase();
  }

  print('Pesquisa encerrada.');
}