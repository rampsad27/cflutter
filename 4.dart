//remove all "_" from the given String. "_Mito_chondria". Use Extension for this.
void main(List<String> args) {
  String name = "_Mito_chondria";
  name = name.removeUnderscore();

  print(name);
}

extension StringExtension on String {
  String removeUnderscore() {
    return this.replaceAll('_', '');
  }
}
