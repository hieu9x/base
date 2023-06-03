extension TimeExt on Duration {
  String get timeExt {
    String second = _twoDigits(inSeconds.remainder(60), 'seconds');
    String minutes = _twoDigits(inMinutes.remainder(60), 'minutes');
    String hours = _twoDigits(inHours, 'hours');
    return '$hours:$minutes:$second';
  }

  String _twoDigits(int n, String unitType) {
    switch (unitType) {
      case 'minutes':
        if (n >= 10) return '$n';
        return '0$n';
      case 'hours':
        if (n >= 10) return '$n';
        return '0$n';
      default:
        if (n >= 10) return '$n';
        return '0$n';
    }
  }
}
