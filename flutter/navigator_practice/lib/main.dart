import 'package:flutter/material.dart';
import 'package:navigator_practice/detail_page.dart';
import 'package:navigator_practice/first_page.dart';
import 'package:navigator_practice/list_page.dart';
import 'package:navigator_practice/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyList(),
      routes: <String, WidgetBuilder>{
        'first': (context) => const FirstPage(),
        'second': (context) => const SecondPage(),
        'list': (context) => MyList(),
        'detail': (context) => MyDetail(),
      },
    );
  }
}
