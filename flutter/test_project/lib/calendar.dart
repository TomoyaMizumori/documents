import 'package:flutter/material.dart';

List makeDateList() {
  const dayNumList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  final monthList = List.generate(12, (index) => index + 1);
  final now = DateTime.now();
  var dateList = [];
  monthList.asMap().forEach(
    (index, element) {
      if (now.month == element) {
        for (var i = now.day; i <= dayNumList[index]; i++) {
          dateList = [
            ...dateList,
            DateTime(now.year, element, i),
          ];
        }
      } else if (now.month < element) {
        for (var i = 1; i <= dayNumList[index]; i++) {
          dateList = [
            ...dateList,
            DateTime(now.year, element, i),
          ];
        }
      }
    },
  );
  return dateList;
}

String weekdayFunction(int weekday) {
  switch (weekday % 7) {
    case 0:
      return 'Mon';
    case 1:
      return 'Tue';
    case 2:
      return 'Wed';
    case 3:
      return 'Thur';
    case 4:
      return 'Fri';
    case 5:
      return 'Sat';
    case 6:
      return 'Sun';
    default:
      return 'error';
  }
}

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.dateList,
  });

  final List dateList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: dateList.length,
      itemBuilder: (context, index) {
        final element = dateList[index];
        final weekday = weekdayFunction(index);
        var textColor = Colors.black;
        if (weekday == 'Sat') {
          textColor = Colors.blue;
        }
        if (weekday == 'Sun') {
          textColor = Colors.red;
        }
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
            onTap: () => debugPrint('selected ${element.month}/${element.day}'),
            title: Text(
              '${weekday} ${element.month}/${element.day}',
              style: TextStyle(color: textColor),
            ),
            subtitle: const Text('schedule:'),
          );
        } else {
          return ListTile(
            leading: const Icon(
              Icons.arrow_forward,
              size: 60,
              color: Colors.blue,
            ),
            title: Text(
              '${weekday} ${element.month}/${element.day}',
              style: TextStyle(color: textColor),
            ),
            subtitle: const Text('schedule:'),
            onTap: () => debugPrint('selected ${element.month}/${element.day}'),
          );
        }
      },
    ));
  }
}
