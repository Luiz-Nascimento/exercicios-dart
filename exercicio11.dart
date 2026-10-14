import 'dart:io';

class Professor {
  String codigo;
  String nome;
  String sexo;
  int horas;

  Professor(this.codigo, this.nome, this.sexo, this.horas);

  double salarioBruto() {
    return horas * 12.30;
  }

  double salarioLiquido() {
    if (sexo == 'M') {
      return salarioBruto() * 0.90;
    } else {
      return salarioBruto() * 0.95;
    }
  }

  @override
  String toString() {
    return "Codigo: $codigo | Nome: $nome | Bruto: R\$ ${salarioBruto().toStringAsFixed(2)} | Liquido: R\$ ${salarioLiquido().toStringAsFixed(2)}";
  }
}

void main() {
  List<Professor> professores = [];

  stdout.write('Codigo (9999 para encerrar): ');
  String codigo = stdin.readLineSync()!;

  while (codigo != '9999') {
    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Sexo (M ou F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Horas de aula no mes: ');
    int horas = int.parse(stdin.readLineSync()!);

    Professor p = Professor(codigo, nome, sexo, horas);
    professores.add(p);

    print('');
    stdout.write('Codigo (9999 para encerrar): ');
    codigo = stdin.readLineSync()!;
  }

  print('');
  print('===== LISTAGEM =====');
  for (var p in professores) {
    print(p);
  }

  double somaMasc = 0;
  double somaFem = 0;
  int qtdMasc = 0;
  int qtdFem = 0;

  for (var p in professores) {
    if (p.sexo == 'M') {
      somaMasc = somaMasc + p.salarioLiquido();
      qtdMasc++;
    } else {
      somaFem = somaFem + p.salarioLiquido();
      qtdFem++;
    }
  }

  print('');
  print('===== MEDIAS DOS SALARIOS LIQUIDOS =====');

  if (qtdMasc > 0) {
    double mediaMasc = somaMasc / qtdMasc;
    print('Masculino: R\$ ${mediaMasc.toStringAsFixed(2)}');
  } else {
    print('Masculino: nenhum professor cadastrado.');
  }

  if (qtdFem > 0) {
    double mediaFem = somaFem / qtdFem;
    print('Feminino: R\$ ${mediaFem.toStringAsFixed(2)}');
  } else {
    print('Feminino: nenhuma professora cadastrada.');
  }
}