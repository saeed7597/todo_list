class CurrentDate {
  DateTime now = DateTime.now();
  static DateTime dateTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);

  static String getDate() {
    return dateTime.toString();
  }
}