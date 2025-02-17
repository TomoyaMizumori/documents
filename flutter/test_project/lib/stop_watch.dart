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
