import 'package:flutter/material.dart';

bool _start = start;
bool get start => _start;
// ignore:avoid_positional_boolean_parameters
set setStart(bool value) => _start = value;

Future<Duration> stopWatch(int maxMin) async {
  const duration = Duration(milliseconds: 10);
  var time = const Duration(milliseconds: 0);
  for (var i = 0; i < 100 * 60 * maxMin; i++) {
    if (_start) {
      await Future.delayed(
        duration,
        () => time += duration,
      );
    } else {
      debugPrint('Time is $time');
      break;
    }
  }
  return time;
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
