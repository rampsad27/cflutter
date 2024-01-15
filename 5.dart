//get cube of any integer. (Use extension on int)
import 'dart:io';

void main(List<String> args) {
  print("Enter a number: ");
  int a = int.parse(stdin.readLineSync()!);

  print("The cube is ${a.getCube()}");
}

extension IntExtension on int {
  int getCube() {
    return this * this * this;
  }
}
