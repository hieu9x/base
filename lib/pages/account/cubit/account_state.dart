// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_cubit.dart';


class AccountState extends Equatable {
  const AccountState({
    this.pageStatus = FetchStatus.idle,
    this.countNotification = 0,
    this.errorMsg = "",
  });

  final FetchStatus pageStatus;
  final int countNotification;
  final String errorMsg;

  @override
  List<Object?> get props => [pageStatus, countNotification, errorMsg];

  AccountState copyWith({
    FetchStatus? pageStatus,
    int? countNotification,
    String? errorMsg,
  }) {
    return AccountState(
      pageStatus: pageStatus ?? this.pageStatus,
      countNotification: countNotification ?? this.countNotification,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
