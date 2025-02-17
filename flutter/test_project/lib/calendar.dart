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
