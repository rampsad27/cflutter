//Check if a number is a palindrome
import 'dart:io';

void main() {
  print("number giv");
  String userInput = stdin.readLineSync()!;
  int num = int.parse(userInput);

  palin(num);
}

void palin(num) {
  int y = int.parse(num.toString().split('').reversed.join(''));
  if (num == y) {
    print("it is palindrome");
  } else {
    print(" it is not palindrome");
  }
}
