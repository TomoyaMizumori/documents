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
            Expanded(
                child: ListView.builder(
              itemCount: dateList.length,
              itemBuilder: (context, index) {
                final element = dateList[index];
                final weekday = weekdayFunction(index);
                if (index == 0) {
                  return ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      child: const Center(
                        child: Text(
                          'Today',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text('${weekday} ${element.month}/${element.day}'),
                    subtitle: const Text('schedule:'),
                  );
                } else {
                  return ListTile(
                    leading: const Icon(
                      Icons.arrow_forward,
                      size: 60,
                      color: Colors.blue,
                    ),
                    title: Text('${weekday} ${element.month}/${element.day}'),
                    subtitle: const Text('schedule:'),
                  );
                }
              },
            ))
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

class StopWatch extends StatelessWidget {
  const StopWatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 160,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              if (!start) {
                setStart = true;
                stopWatch(10);
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.start,
                  color: Colors.white,
                ),
                Text('START', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
        Container(
          width: 160,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () => {setStart = false},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timelapse,
                  color: Colors.white,
                ),
                Text('STOP', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
