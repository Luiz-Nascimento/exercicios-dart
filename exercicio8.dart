import 'dart:io';

class Candidato {
  String codigo;
  String curso;
  String nome;
  String sexo;
  int pontuacao;

  Candidato(this.codigo, this.curso, this.nome, this.sexo, this.pontuacao);

  @override
  String toString() {
    return "Codigo: $codigo | Nome: $nome | Pontuacao: $pontuacao";
  }
}

void main() {
  List<Candidato> candidatos = [];

  stdout.write('Codigo (0000 para encerrar): ');
  String codigo = stdin.readLineSync()!;

  while (codigo != '0000') {
    stdout.write('Curso (CC ou SI): ');
    String curso = stdin.readLineSync()!.toUpperCase();

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Sexo (M ou F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Pontuacao (0 a 5000): ');
    int pontuacao = int.parse(stdin.readLineSync()!);

    Candidato c = Candidato(codigo, curso, nome, sexo, pontuacao);
    candidatos.add(c);

    print('');
    stdout.write('Codigo (0000 para encerrar): ');
    codigo = stdin.readLineSync()!;
  }

  print('');
  print('===== RESULTADOS =====');

  print('a) Candidatos de CC com mais de 2500 pontos:');
  bool achouCC = false;
  for (var c in candidatos) {
    if (c.curso == 'CC' && c.pontuacao > 2500) {
      print(c);
      achouCC = true;
    }
  }
  if (!achouCC) {
    print('Nenhum candidato.');
  }


  Candidato? menorMasc;
  for (var c in candidatos) {
    if (c.sexo == 'M') {
      if (menorMasc == null || c.pontuacao < menorMasc.pontuacao) {
        menorMasc = c;
      }
    }
  }
  if (menorMasc != null) {
    print('b) Menor pontuacao masculina: ${menorMasc.nome} (${menorMasc.pontuacao} pontos)');
  } else {
    print('b) Nenhum candidato do sexo masculino.');
  }


  Candidato? maiorSI;
  for (var c in candidatos) {
    if (c.sexo == 'M' && c.curso == 'SI') {
      if (maiorSI == null || c.pontuacao > maiorSI.pontuacao) {
        maiorSI = c;
      }
    }
  }
  if (maiorSI != null) {
    print('c) Maior pontuacao masculina em SI: codigo ${maiorSI.codigo} (${maiorSI.pontuacao} pontos)');
  } else {
    print('c) Nenhum candidato masculino em SI.');
  }


  int totalMasc = 0;
  int totalFem = 0;
  for (var c in candidatos) {
    if (c.sexo == 'M') {
      totalMasc++;
    } else {
      totalFem++;
    }
  }

  int total = candidatos.length;
  if (total > 0) {
    double percMasc = totalMasc * 100 / total;
    double percFem = totalFem * 100 / total;
    print('d) Masculino: ${percMasc.toStringAsFixed(1)}%');
    print('   Feminino: ${percFem.toStringAsFixed(1)}%');
  } else {
    print('d) Nenhum candidato inscrito.');
  }
}