class CurrentDate {
  static DateTime now = DateTime.now();
  static DateTime dateTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,);

  static DateTime getDate() {
    return dateTime;
  }
}