enum TimePeriod { today, sevenDays, thirtyDays, sixMonths, oneYear, fiveYears }

final daysCountArr = [1, 7, 30, 180, 365, 1825];
final titleArr = ['Today', '7 Days', '30 Days', '6 Months', '1 Year', '5 Years'];

extension TimePeriodExtension on TimePeriod {
  int get days {
    return daysCountArr[index];
  }

  String get str {
    return titleArr[index];
  }
}

class TimePeriodHelper {
  static String getTitleByDaysCount(int daysCount) {
    Map<int, String> mergedMap =
        Map.fromIterables(daysCountArr, List.generate(titleArr.length, (index) => titleArr[index]));
    return mergedMap[daysCount]!;
  }
}
