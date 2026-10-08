/*Dado o seguinte mapa de preços de bolos:
const boloPrecos = {'ovos' : 5,5, 'chocolate' : 7,5, 'cenoura' : 6,5, };
Escreva um programa em Dart para calcular o total para um determinado pedido.
Por exemplo, dada a seguinte ordem:
const ordem =['ovos', 'chocolate'];
O programa deve imprimir -> Total = 13.0
OBS.: Se um bolo não estiver no cardápio, o programa deve imprimir algo assim ->
limão não está no cardápio*/
import 'dart:io';

void main() {
  const boloPrecos = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};
  List<String> ordem = [];
  print("Quantos bolos foram ordenados?");
  int qtdBolos = int.parse(stdin.readLineSync() ?? '0');
  for (int i = 0; i < qtdBolos; i++) {
    print("Qual foi o sabor do ${i + 1}º bolo?");
    String saborBolo = stdin.readLineSync()!;
    if (!boloPrecos.containsKey(saborBolo)) {
      print("Esse sabor de bolo não está no cardápio");
    }
    else {
        ordem.add(saborBolo);
    }
  }
  double valorTotal = 0;
  for (var saborBolo in ordem) {
    valorTotal += boloPrecos[saborBolo]!;
  }
  print("O valor total do pedido foi R\$$valorTotal");
}
