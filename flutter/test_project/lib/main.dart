import 'package:flutter/material.dart';
import 'package:test_project/calendar.dart';
import 'package:test_project/stop_watch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: MyHomePage(title: 'Flutter Exercise'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final dateList = makeDateList();

  void debugFunction() {
    debugPrint('pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('右下のボタンをクリックしてみて'),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: const Center(
                child: Text(
                  'Image',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image.asset('images/pythonIcon.png'),
                ),
                Expanded(
                  child: Image.network(
                      'https://img.icons8.com/ios/150/python--v1.png'),
                ),
              ],
            ),
            const Text(
              'StopWatch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const StopWatch(),
            const Text(
              'Calendar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            Calendar(dateList: dateList)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: debugFunction,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
