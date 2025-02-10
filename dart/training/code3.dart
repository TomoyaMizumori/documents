class StaticDemo {
  static String a = "this is a";
  String b;
  int c;

  StaticDemo(this.b, this.c);

  void description() {
    print('a : ${a}, b : ${this.b}, c : ${this.c}');
  }
}
