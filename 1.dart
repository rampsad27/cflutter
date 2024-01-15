//Average numbers in an array (Finding mean)
void main() {
  List<int> arr = [2, 4, 5, 6, 7, 6, 4, 3];
  var m = mean(arr);
  print(m);
}

double mean(List<int> arr) {
  int len = arr.length;
  int sum = 0;
  for (int i = 0; i < len; i++) {
    sum += arr[i];
  }
  return sum / len;
}
