// //Simple Calculator with Enums
// import 'dart:io';

// enum ColorEnum {
//   div,
//   mul,
//   sub,
//   add,
// }

// void main() {
//   print("Enter a number: ");
//   int a = int.parse(stdin.readLineSync()!);

//   print("Enter another number: ");
//   int b = int.parse(stdin.readLineSync()!);

//   print("Choose operation (div, mul, sub, add): ");
//   String operation = stdin.readLineSync()!;

//   performOperation(a, b, operation);
// }

// void performOperation(int a, int b, operation) {
//   switch (operation) {
//     case ColorEnum.div:
//       print("${a / b}");
//       break;
//     case ColorEnum.mul:
//       print("${a * b}");
//       break;
//     case ColorEnum.sub:
//       print("${a - b}");
//       break;
//     case ColorEnum.add:
//       print("${a + b}");
//       break;
//     // default:
//     //   print("Default");
//   }
// }
import 'dart:io';

enum Operation { Add, Sub, Mul, Div }

void main() {
  print('Enter a number:');
  int num1 = int.parse(stdin.readLineSync()!);

  print('Enter second number:');
  int num2 = int.parse(stdin.readLineSync()!);

  print('Choose operation: Add Sub Mul Div');
  Operation operation = Operation.values[int.parse(stdin.readLineSync()!) - 1];

  int result = performOperation(num1, num2, operation);
  print('The result is: $result');
}

int performOperation(int num1, int num2, Operation operation) {
  switch (operation) {
    case Operation.Add:
      return num1 + num2;
    case Operation.Sub:
      return num1 - num2;
    case Operation.Mul:
      return num1 * num2;
    case Operation.Div:
      return num1 ~/ num2;
  }
}
