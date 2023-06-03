enum FetchStatus {
  idle,
  fetchInProgress,
  fetchSuccess,
  fetchFailure,
  fetchCanceled,
}

enum CalendarSchedule {
  working('working'),
  weekend('weekend');

  final String value;
  const CalendarSchedule(
    this.value,
  );
}

enum TrackingType {
  missing('missing'),
  success('success'),
  late('late');

  final String value;
  const TrackingType(
    this.value,
  );
}
