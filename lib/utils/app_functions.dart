class AppFunctions {
  static String getFormattedDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static int getTimestampFromDate(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime getDateFromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}
