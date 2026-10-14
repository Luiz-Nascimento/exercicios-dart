import 'dart:io';

class Candidato {
  String nome;
  String sexo;
  int idade;
  bool experiencia;

  Candidato(this.nome, this.sexo, this.idade, this.experiencia);

  @override
  String toString() {
    return "Nome: $nome | Sexo: $sexo | Idade: $idade | Experiencia: ${experiencia ? 'Sim' : 'Nao'}";
  }
}

void main() {
  List<Candidato> candidatos = [];

  stdout.write('Nome (FIM para encerrar): ');
  String nome = stdin.readLineSync()!;

  while (nome.toUpperCase() != 'FIM') {
    stdout.write('Sexo (M ou F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Idade: ');
    int idade = int.parse(stdin.readLineSync()!);

    stdout.write('Tem experiencia? (S ou N): ');
    String resp = stdin.readLineSync()!.toUpperCase();
    bool experiencia = resp == 'S';

    Candidato c = Candidato(nome, sexo, idade, experiencia);
    candidatos.add(c);

    print('');
    stdout.write('Nome (FIM para encerrar): ');
    nome = stdin.readLineSync()!;
  }

  print('');
  print('===== RESULTADOS =====');

  int totalMasc = 0;
  int totalFem = 0;
  for (var c in candidatos) {
    if (c.sexo == 'M') {
      totalMasc++;
    } else {
      totalFem++;
    }
  }
  print('a) Masculino: $totalMasc | Feminino: $totalFem');

  int somaIdades = 0;
  int qtdHomensExp = 0;
  for (var c in candidatos) {
    if (c.sexo == 'M' && c.experiencia) {
      somaIdades = somaIdades + c.idade;
      qtdHomensExp++;
    }
  }
  if (qtdHomensExp > 0) {
    double media = somaIdades / qtdHomensExp;
    print('b) Idade media dos homens com experiencia: ${media.toStringAsFixed(1)} anos');
  } else {
    print('b) Nenhum homem com experiencia.');
  }

  int homensMais45 = 0;
  for (var c in candidatos) {
    if (c.sexo == 'M' && c.idade > 45) {
      homensMais45++;
    }
  }
  if (totalMasc > 0) {
    double perc = homensMais45 * 100 / totalMasc;
    print('c) Homens com mais de 45 anos: ${perc.toStringAsFixed(1)}%');
  } else {
    print('c) Nenhum candidato do sexo masculino.');
  }

  int mulheresJovensExp = 0;
  for (var c in candidatos) {
    if (c.sexo == 'F' && c.idade < 30 && c.experiencia) {
      mulheresJovensExp++;
    }
  }
  print('d) Mulheres com menos de 30 anos e com experiencia: $mulheresJovensExp');

  Candidato? maisNova;
  for (var c in candidatos) {
    if (c.sexo == 'F' && c.experiencia) {
      if (maisNova == null || c.idade < maisNova.idade) {
        maisNova = c;
      }
    }
  }
  if (maisNova != null) {
    print('e) Candidata mais nova com experiencia: ${maisNova.nome} (${maisNova.idade} anos)');
  } else {
    print('e) Nenhuma candidata com experiencia.');
  }
}