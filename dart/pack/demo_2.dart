// User クラスを定義
// プロパティは名前とメールアドレスと年齢
class User {
  String? name;
  String? email;
  int age;

  // コンストラクタ
  User(this.name, this.email, this.age);

  void intro() {
    // インスタンスの情報を出力するメソッド
    print('name : ${this.name}, email : ${this.email}, age : ${this.age}');
  }
}
