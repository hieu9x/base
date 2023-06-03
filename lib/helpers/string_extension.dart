import '../global/environment.dart';

extension StringExt on String {
  String get urlLink {
    if (startsWith("https")) {
      return this;
    }
    if (startsWith("http")) {
      return replaceAll('http', 'https');
    }
    return Environment.baseUrl + this;
  }

  bool get isAudio {
    return split(".").last == "mp3";
  }

  String get upCaseFirstText {
    String value = '';
    value = replaceFirst(this[0], this[0].toUpperCase());
    return value;
  }
}
