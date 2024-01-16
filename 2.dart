// //Check if a number is a palindrome
import 'dart:io';

checkPalindrom(int number) {
  String numToString = number.toString();

  return numToString == numToString.split('').reversed.join();
}

void main() {
  try {
    print("enter a number:");
    int stoNum = int.parse(stdin.readLineSync()!);

    if (checkPalindrom(stoNum)) {
      print("$stoNum is palindrome");
    } else {
      print("$stoNum is not");
    }
  } catch (e) {
    print("Must enter a integer");
  }
}
