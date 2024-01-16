//calculator
import 'dart:io';

enum CalculatorEnum {
  div,
  mul,
  sub,
  add,
}

void main() {
  print("Enter a number: ");
  double a = double.parse(stdin.readLineSync()!);

  print("Enter another number: ");
  double b = double.parse(stdin.readLineSync()!);

  print("Choose operation (div, mul, sub, add): ");
  String operation = stdin.readLineSync()!.toLowerCase();

  performOperation(a, b, operation);
}

void performOperation(double a, double b, String operation) {
  double result;

  switch (operation) {
    case 'div':
      result = a / b;
      break;
    case 'mul':
      result = a * b;
      break;
    case 'sub':
      result = a - b;
      break;
    case 'add':
      result = a + b;
      break;
    default:
      print("Invalid operation");
      return;
  }

  print("Result: $result");
}
