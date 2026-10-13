import 'dart:io';

/*4) Elabore um algoritmo para ler a matrícula, nome, sexo (“M’ e “F”), três notas e o número
de faltas dos alunos de uma escola, onde o FLAG é a matrícula =’00000’. E imprima os
seguintes resultados:
a) A média da turma.
b) O percentual de alunos aprovados.
c) A matrícula do aluno do sexo masculino e feminino que possui a maior média e que
foi aprovado.
d) A média dos alunos do sexo feminino.
Obs: Considere para aprovação a média 7,0 e o limite de faltas 18*/
class Aluno {
  String matricula;
  String nome;
  String sexo;
  List<double> notas;
  int qtdFaltas;

  Aluno(this.matricula, this.nome, this.sexo, this.notas, this.qtdFaltas);

  double media() {
    double sum = 0;
    for (var nota in this.notas) {
      sum += nota;
    }
    if (notas.isEmpty) {
      return 0;
    }
    return sum / notas.length;
  }

  bool isAprovado() {
    if (media() < 7 || qtdFaltas > 18) {
      return false;
    } else
      return true;
  }

  @override
  String toString() {
    return "Matrícula: " +
        matricula +
        "\nNome: " +
        nome +
        "\nSexo: " +
        sexo +
        "\nNotas: " +
        notas.toString() +
        "\nQuantidade de faltas: " +
        qtdFaltas.toString();
  }
}

void main() {
  List<Aluno> alunos = [];
  String matricula = "";
  while (true) {
    print("Digite o número da matrícula");
    matricula = stdin.readLineSync() ?? '00000';
    if (matricula == '00000') {
      break;
    }
    print("Digite o nome do aluno: ");
    String nome = stdin.readLineSync() ?? 'Fulano';
    print("Digite qual o sexo: (M/F)");
    String sexo = stdin.readLineSync() ?? '';
    List<double> notas = [];
    for (int i = 1; i < 4; i++) {
      print("Digite a $iª nota: ");
      double nota = double.parse(stdin.readLineSync() ?? '0');
      notas.add(nota);
    }
    print("Digite a quantidade de faltas: ");
    int qtdFaltas = int.parse(stdin.readLineSync() ?? '0');
    var aluno = Aluno(matricula, nome, sexo, notas, qtdFaltas);
    alunos.add(aluno);
  }
  int qtdAprovados = 0;
  int qtdFeminina = 0;
  double somaTurma = 0;
  double somaFeminina = 0;
  double mediaTurma = 0;
  double mediaFeminina = 0;
  double maiorMediaAprovadoMasculino = 0;
  String matriculaMasculinoMaiorMedia = "";
  String matriculaFemininoMaiorMedia = "";
  double maiorMediaAprovadoFeminino = 0;
  for (var aluno in alunos) {
    somaTurma += aluno.media();
    if (aluno.isAprovado()) {
      qtdAprovados += 1;
      if (aluno.sexo == "M") {
        if (aluno.media() > maiorMediaAprovadoMasculino) {
          maiorMediaAprovadoMasculino = aluno.media();
          matriculaMasculinoMaiorMedia = aluno.matricula;
        }
      } else if (aluno.sexo == "F") {
        if (aluno.media() > maiorMediaAprovadoFeminino) {
          maiorMediaAprovadoFeminino = aluno.media();
          matriculaFemininoMaiorMedia = aluno.matricula;
        }
      }
    }
    if (aluno.sexo == "F") {
      qtdFeminina += 1;
      somaFeminina += aluno.media();
    }
  }
  mediaTurma = somaTurma / alunos.length;
  mediaFeminina = somaFeminina / qtdFeminina;
  print("A média da turma é $mediaTurma");
  print(
    "O percentual de aprovados é: ${(qtdAprovados / alunos.length) * 100}%",
  );
  print(
    "A matrícula do aluno de sexo masculino com maior média foi: $matriculaMasculinoMaiorMedia",
  );
  print(
    "A matrícula da aluna de sexo feminino com maior média foi: $matriculaFemininoMaiorMedia ",
  );
  print("A média das alunas de sexo feminino foi de: $mediaFeminina");
}
