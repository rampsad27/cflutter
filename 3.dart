// //Simple Calculator with Enums
import 'dart:io';

enum ColorEnum {
  div,
  mul,
  sub,
  add,
}

void main() {
  print("Enter a number: ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter another number: ");
  int b = int.parse(stdin.readLineSync()!);

  print("Choose operation (div, mul, sub, add): ");
  String operation = stdin.readLineSync()!;

  performOperation(a, b, operation);
}

void performOperation(int a, int b, operation) {
  switch (operation) {
    case ColorEnum.div:
      print("${a / b}");
      break;
    case ColorEnum.mul:
      print("${a * b}");
      break;
    case ColorEnum.sub:
      print("${a - b}");
      break;
    case ColorEnum.add:
      print("${a + b}");
      break;
  }
}
