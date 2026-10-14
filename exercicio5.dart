import 'dart:io';

class RecemNascido {
  String nome;
  String sexo;
  double peso;

  RecemNascido(this.nome, this.sexo, this.peso);

  @override
  String toString() {
    return "Nome: " +
        nome +
        "\nSexo: " +
        sexo +
        "\nPeso: " +
        peso.toString() +
        "\nClassificação: " +
        classificacao().toString();
  }

  String classificacao() {
    if (this.peso > 0 && this.peso <= 2) {
      return "Baixo Peso";
    } else if (this.peso > 2 && this.peso <= 4) {
      return "Normal";
    } else {
      return "Alto Peso";
    }
  }
}

void main() {
  List<RecemNascido> bebes = [];
  String nomeMaiorPesoFeminino = "";
  double maiorPesoFeminino = 0;
  int qtdPesoBaixo = 0;
  int qtdNormal = 0;
  int qtdPesoAlto = 0;
  while (true) {
    print("Deseja adicionar récem nascidos? [S/N]:");
    String resposta = stdin.readLineSync() ?? 'N';
    if (resposta == 'N') {
      break;
    }
    print("Nome do recém nascido: ");
    String nome = stdin.readLineSync() ?? '';
    print("Sexo do recém nascido: [M/F]:");
    String sexo = stdin.readLineSync() ?? '';
    print("Peso do recém nascido: ");
    double peso = double.parse(stdin.readLineSync() ?? '');
    if (sexo == 'F') {
      if (peso > maiorPesoFeminino) {
        maiorPesoFeminino = peso;
        nomeMaiorPesoFeminino = nome;
      }
    }
    RecemNascido bebe = RecemNascido(nome, sexo, peso);
    if (bebe.classificacao() == "Baixo Peso") {
      qtdPesoBaixo++;
    } else if (bebe.classificacao() == "Normal") {
      qtdNormal++;
    } else if (bebe.classificacao() == "Alto Peso") {
      qtdPesoAlto++;
    }
    bebes.add(bebe);
  }

  for (var bebe in bebes) {
    print(bebe);
  }
  print(
    "Recém nascido do sexo feminino com maior peso foi: $nomeMaiorPesoFeminino",
  );
  print("Porcentagem de peso baixo: ${(qtdPesoBaixo / bebes.length) * 100}%");
  print("Porcentagem de peso normal: ${(qtdNormal / bebes.length) * 100}%");
  print("Porcentagem de peso alto: ${(qtdPesoAlto / bebes.length) * 100}%");
}
