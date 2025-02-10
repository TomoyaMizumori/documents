import 'dart:io'; // パッケージのインポート

import 'package:email_validator/email_validator.dart'; // パッケージのインポート

import 'demo_2.dart'; // demo_2.dart ファイルの内容をインポート

void main() {
  print('please input your name'); // 入力を促すメッセージ
  String? name = stdin.readLineSync(); // コマンドラインから値を読み取る
  print('please input your email'); // 入力を促すメッセージ
  String? email = stdin.readLineSync(); // コマンドラインから値を読み取る
  print('please input your age'); // 入力を促すメッセージ
  String? inputAge = stdin.readLineSync(); // コマンドラインから値を読み取る
  if (inputAge == null || inputAge == '') {
    inputAge = '0';
  } // parse メソッドでエラーが出る値の時は文字列型の '0' をセットする
  int age = int.parse(inputAge); // 文字列型を整数型に変更するメソッド
  // バリデーションが通ればインスタンスを生成し、メソッドを実行
  if (email != null && EmailValidator.validate(email)) {
    User user = User(name, email, age); // インスタンスを生成
    user.intro(); // メソッドを呼び出す
  } else {
    // 無効なメールアドレスであればメッセージを表示
    print('please input valid email');
  }
}
