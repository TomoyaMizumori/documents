void main() {
  final numbers = [6, 4];

  for (int i = 1; i <= 100; i++) {
    if (i % (numbers[0] * numbers[1]) == 0) {
      print("FizzBuzz");
    } else if (i % numbers[0] == 0) {
      print("Fizz");
    } else if (i % numbers[1] == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }
}
