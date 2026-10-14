import 'dart:io';

void main() {
  stdout.write('Digite o número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  int a = 1, b = 5, c = 100;

  for (int i = 0; i < n; i++) {
    if (i % 3 == 0) {
      stdout.write('$a ');
      a *= 2;
    } else if (i % 3 == 1) {
      stdout.write('$b ');
      b += 5;
    } else {
      stdout.write('$c ');
      c -= 10;
    }
  }

  print('');
}