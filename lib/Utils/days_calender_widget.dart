const Map<int, String> daysMap = {
  1: "MON",
  2: "TUE",
  3: "WED",
  4: "THU",
  5: "FRI",
  6: "SAT",
  7: "SUN",
};

List<DateTime> generateDays({
  required DateTime month,
}) =>
    List.generate(
      month.daysInMonth,
      (index) => DateTime(month.year, month.month, 1).add(
        Duration(days: index),
      ),
    );

extension DaysInMonthExtension on DateTime {
  int get daysInMonth {
    return DateTime(year, month + 1, 1)
        .difference(
          DateTime(year, month, 1),
        )
        .inDays;
  }
}
