extension DateExt on int {
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(this * 1000);
}
