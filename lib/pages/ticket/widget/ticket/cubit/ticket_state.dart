// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ticket_cubit.dart';

class TicketState extends Equatable {
  const TicketState({
    this.pageStatus = FetchStatus.idle,
    this.countNotification = 0,
    this.errorMsg = "",
  });

  final FetchStatus pageStatus;
  final int countNotification;
  final String errorMsg;

  @override
  List<Object?> get props => [pageStatus, countNotification, errorMsg];

  TicketState copyWith({
    FetchStatus? pageStatus,
    int? countNotification,
    String? errorMsg,
  }) {
    return TicketState(
      pageStatus: pageStatus ?? this.pageStatus,
      countNotification: countNotification ?? this.countNotification,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
